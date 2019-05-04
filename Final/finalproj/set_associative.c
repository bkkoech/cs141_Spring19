#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "memory_block.h"
#include "set_associative.h"

set_associative_cache* sac_init(main_memory* mm)
{
    set_associative_cache* result = malloc(sizeof(set_associative_cache));
    result->mm = mm;
    result->cs = cs_init();

    // set dirty bits to 0, init memory_blocks, init used_count
    for(int i = 0; i < SET_ASSOCIATIVE_NUM_SETS; i++){ 
        
        for (int j = 0; j < SET_ASSOCIATIVE_NUM_WAYS; j++){
            result->cache[i][j] = NULL;
            result->dirty_bits[i][j] = false;
            result->lru_count[i][j] = j;
        }
    }
    return result;
}

static int addr_to_set(void* addr)
{
    uint16_t result = ((int)addr >> MAIN_MEMORY_BLOCK_SIZE_LN);
    result = result & (uint16_t)(SET_ASSOCIATIVE_NUM_SETS-1);
    return result;
}

static void mark_as_used(set_associative_cache* sac, int set, int way)
{
    int index = 0;
    // find index of way 
    for (int j = 0; j < SET_ASSOCIATIVE_NUM_WAYS; j++){
        if (sac->lru_count[set][j] == way){
            index = j;
        }
    }
    // move way to back
    for (int i = index; i < SET_ASSOCIATIVE_NUM_WAYS-1; i++){
        sac->lru_count[set][i] = sac->lru_count[set][i+1];
    }
    sac->lru_count[set][SET_ASSOCIATIVE_NUM_WAYS-1] = way;
}

static int lru(set_associative_cache* sac, int set)
{
    return sac->lru_count[set][0];
}

void sac_store_word(set_associative_cache* sac, void* addr, unsigned int val)
{
    memory_block* cacheline = NULL;
    int set = 0;
    int way = 0;

    // Precompute start address of block
    size_t addr_offt = (size_t) (addr - MAIN_MEMORY_START_ADDR) % MAIN_MEMORY_BLOCK_SIZE;
    void* mb_start_addr = addr - addr_offt;

    // compute set from addr
    set = addr_to_set(mb_start_addr);

    // look through set ways to see if already present
    for (int j = 0; j < SET_ASSOCIATIVE_NUM_WAYS; j++){
        if (sac->cache[set][j] != NULL && sac->cache[set][j]->start_addr == mb_start_addr){
            cacheline = sac->cache[set][j];
            way = j;
        }
    }

    // if hit
    if (cacheline != NULL){
        unsigned int* mb_addr = cacheline->data + addr_offt;
        *mb_addr = val;
        sac->dirty_bits[set][way] = true;
        mark_as_used(sac, set, way);
    }
    //if miss, need to evict lru
    else {
        ++sac->cs.w_misses;
        way = lru(sac, set);
        cacheline = sac->cache[set][way];
        // check dirty bit
        if (cacheline != NULL && sac->dirty_bits[set][way] == true){
            mm_write(sac->mm, cacheline->start_addr, cacheline);
        }
        if(cacheline != NULL){
            mb_free(cacheline);
        }
        cacheline = mm_read(sac->mm, mb_start_addr);
        sac->cache[set][way] = cacheline;
        unsigned int* mb_addr = cacheline->data + addr_offt;
        *mb_addr = val;
        sac->dirty_bits[set][way] = true;
        mark_as_used(sac, set, way);
    }
    // Update statistics
    ++sac->cs.w_queries;
}


unsigned int sac_load_word(set_associative_cache* sac, void* addr)
{
    memory_block* cacheline = NULL;
    unsigned int* mb_addr = 0;
    int set = 0;
    int way = 0;
    int result = 0;

    // Precompute start address of block
    size_t addr_offt = (size_t) (addr - MAIN_MEMORY_START_ADDR) % MAIN_MEMORY_BLOCK_SIZE;
    void* mb_start_addr = addr - addr_offt;

    // compute set from addr
    set = addr_to_set(mb_start_addr);

    // look through set ways to see if already present
    for (int j = 0; j < SET_ASSOCIATIVE_NUM_WAYS; j++){
        if (sac->cache[set][j] != NULL && sac->cache[set][j]->start_addr == mb_start_addr){
            cacheline = sac->cache[set][j];
            way = j;
        }
    }

    //if hit
    if (cacheline != NULL){
        mb_addr = cacheline->data + addr_offt;
        result = *mb_addr;
        mark_as_used(sac, set, way);
    }
    // if miss, evict
    else {
        ++sac->cs.r_misses;
        way = lru(sac, set);
        cacheline = sac->cache[set][way];
        
        //check dirty bit
        if (cacheline != NULL && sac->dirty_bits[set][way] == true){
            mm_write(sac->mm, cacheline->start_addr, cacheline);
        }
        if (cacheline != NULL){
            mb_free(cacheline);
        }
        // overwrite by reading data
        cacheline = mm_read(sac->mm, mb_start_addr);
        sac->dirty_bits[set][way] = false;
        sac->cache[set][way] = cacheline;
        mb_addr = cacheline->data + addr_offt;
        result = *mb_addr;
        mark_as_used(sac, set, way);
    }

    // Update statistics
    ++sac->cs.r_queries;
    return result;
}

void sac_free(set_associative_cache* sac)
{
    for(int i = 0; i < SET_ASSOCIATIVE_NUM_SETS; i++){
        for (int j = 0; j < SET_ASSOCIATIVE_NUM_WAYS; j++){
            if (sac->cache[i][j] != NULL){
                mb_free(sac->cache[i][j]);
            }
        }
    }
    free(sac);
}