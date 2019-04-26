#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "memory_block.h"
#include "fully_associative.h"

fully_associative_cache* fac_init(main_memory* mm)
{
    fully_associative_cache* result = malloc(sizeof(fully_associative_cache));
    result->mm = mm;
    result->cs = cs_init();

    // set dirty bits to 0, init memory_blocks, init used_count
    for(int i = 0; i < FULLY_ASSOCIATIVE_NUM_WAYS; i++){ 
        result->dirty_bits[i] = false;
        result->cache[i] = NULL;
        result->lru_count[i] = 0;
    }
    return result;
}


static void mark_as_used(fully_associative_cache* fac, int way)
{
    // set the lru_count
    for (int i = 0; i < FULLY_ASSOCIATIVE_NUM_WAYS; i++){
        if (i == way){
            fac->lru_count[i] = 0;
        }
        else {
            if (fac->lru_count[i] != 2147483646) // check overflow
                fac->lru_count[i]++;
        }
    }
}

static int lru(fully_associative_cache* fac)
{
    // return the way of the lru
    int lru = 0;
    int result = 0;

    for (int i = 0; i < FULLY_ASSOCIATIVE_NUM_WAYS; i++){
        if (lru < fac->lru_count[i]){
            lru = fac->lru_count[i];
            result = i;
        }
    }
    return result;
}


void fac_store_word(fully_associative_cache* fac, void* addr, unsigned int val)
{
     memory_block* cacheline = NULL;
     int index = 0;

    // Precompute start address of memory block
    size_t addr_offt = (size_t) (addr - MAIN_MEMORY_START_ADDR) % MAIN_MEMORY_BLOCK_SIZE;
    void* mb_start_addr = addr - addr_offt;

    // look through fac to see if already present
    for (int i = 0; i < FULLY_ASSOCIATIVE_NUM_WAYS; i++){
        if (fac->cache[i] != NULL && fac->cache[i]->start_addr == mb_start_addr){
            cacheline = fac->cache[i];
            index = i;
        }
    }

    // if hit
    if (cacheline != NULL){
        unsigned int* mb_addr = cacheline->data + addr_offt;
        *mb_addr = val;
        fac->dirty_bits[index] = true;
        mark_as_used(fac, index);
    }
    //if miss, need to evict lru
    else {
        ++fac->cs.w_misses;
        index = lru(fac);
        cacheline = fac->cache[index];
        // check dirty bit
        if (cacheline != NULL && fac->dirty_bits[index] == true){
            mm_write(fac->mm, cacheline->start_addr, cacheline);
        }
        if(cacheline != NULL){
            mb_free(cacheline);
        }
        cacheline = mm_read(fac->mm, mb_start_addr);
        fac->cache[index] = cacheline;
        unsigned int* mb_addr = cacheline->data + addr_offt;
        *mb_addr = val;
        fac->dirty_bits[index] = true;
        mark_as_used(fac, index);
    }
    // Update statistics
    ++fac->cs.w_queries;
}


unsigned int fac_load_word(fully_associative_cache* fac, void* addr)
{
    memory_block* cacheline = NULL;
    unsigned int* mb_addr = 0;
    int index = 0;
    int result = 0;

    // Precompute start address of memory block
    size_t addr_offt = (size_t) (addr - MAIN_MEMORY_START_ADDR) % MAIN_MEMORY_BLOCK_SIZE;
    void* mb_start_addr = addr - addr_offt;

    // look through fac to see if already present
    for (int i = 0; i < FULLY_ASSOCIATIVE_NUM_WAYS; i++){
        if (fac->cache[i] != NULL && fac->cache[i]->start_addr == mb_start_addr){
            cacheline = fac->cache[i];
            index = i;
        }
    }
    //if hit
    if (cacheline != NULL){
        mb_addr = cacheline->data + addr_offt;
        result = *mb_addr;
        mark_as_used(fac, index);
    }
    // if miss, evict
    else {
        ++fac->cs.r_misses;
        index = lru(fac);
        cacheline = fac->cache[index];
        //check dirty bit
        if (cacheline != NULL && fac->dirty_bits[index] == true){
            mm_write(fac->mm, cacheline->start_addr, cacheline);
        }
        if (cacheline != NULL){
            mb_free(cacheline);
        }
        // overwrite by reading data
        cacheline = mm_read(fac->mm, mb_start_addr);
        fac->dirty_bits[index] = false;
        fac->cache[index] = cacheline;
        mb_addr = cacheline->data + addr_offt;
        result = *mb_addr;
        mark_as_used(fac, index);
    }

    // Update statistics
    ++fac->cs.r_queries;
    return result;
}

void fac_free(fully_associative_cache* fac)
{
    for(int i = 0; i < FULLY_ASSOCIATIVE_NUM_WAYS; i++){
        if (fac->cache[i] != NULL){
            mb_free(fac->cache[i]);
        }
    }
    free(fac);
}