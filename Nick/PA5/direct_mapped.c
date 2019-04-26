#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "memory_block.h"
#include "direct_mapped.h"

direct_mapped_cache* dmc_init(main_memory* mm)
{
    direct_mapped_cache* result = malloc(sizeof(direct_mapped_cache));
    result->mm = mm;
    result->cs = cs_init();

    // set dirty bits to 0, init memory_blocks
    for(int i = 0; i < DIRECT_MAPPED_NUM_SETS; i++){ 
        result->dirty_bits[i] = false;
        result->cache[i] = NULL;
    }
    return result;
}

static int addr_to_set(void* addr)
{
    uint16_t result = ((int)addr >> MAIN_MEMORY_BLOCK_SIZE_LN);
    result = result & (uint16_t)(MAIN_MEMORY_SIZE_LN-1);
    return result;
}


void dmc_store_word(direct_mapped_cache* dmc, void* addr, unsigned int val)
{
    // Precompute start address of memory block
    size_t addr_offt = (size_t) (addr - MAIN_MEMORY_START_ADDR) % MAIN_MEMORY_BLOCK_SIZE;
    void* mb_start_addr = addr - addr_offt;

    // get cache index for block
    int index = addr_to_set(mb_start_addr); 

    // get cacheline from cashe
    memory_block* cacheline = dmc->cache[index];

    // Check addresses are equal
    if(cacheline != NULL && cacheline->start_addr == mb_start_addr){
        // if equal, update cache line, set dirty bit to true
        // check whether data needs to be written to memory
        unsigned int* mb_addr = cacheline->data + addr_offt;
        *mb_addr = val;
        dmc->dirty_bits[index] = true;
    }
    else {
        //miss
        ++dmc->cs.w_misses;
        // if not equal, need to evcit, check dirty bit
        if(cacheline != NULL && dmc->dirty_bits[index] == true){
            // if dirty bit true, write to memory and overrwite
            mm_write(dmc->mm, cacheline->start_addr, cacheline);
        }
        // if dirty bit false, overrwite
        if(cacheline != NULL){
            mb_free(cacheline);
        }
        cacheline = mm_read(dmc->mm, mb_start_addr);
        dmc->cache[index] = cacheline;
        unsigned int* mb_addr = cacheline->data + addr_offt;
        *mb_addr = val;
        dmc->dirty_bits[index] = true;

    }

    // Update statistics
    ++dmc->cs.w_queries;
}

unsigned int dmc_load_word(direct_mapped_cache* dmc, void* addr)
{   
    // declare result and mb_addr
    unsigned int result;
    unsigned int* mb_addr;

    // Precompute start address of memory block
    size_t addr_offt = (size_t) (addr - MAIN_MEMORY_START_ADDR) % MAIN_MEMORY_BLOCK_SIZE;
    void* mb_start_addr = addr - addr_offt;
    
    // get cache index for block
    int index = addr_to_set(mb_start_addr);

    // get cacheline from cashe
    memory_block* cacheline = dmc->cache[index];    

    // Check addresses are equal
    // check for null
    if(cacheline != NULL && cacheline->start_addr == mb_start_addr){
        // hit if they are
        mb_addr = cacheline->data + addr_offt;
        result = *mb_addr;
    }
    else {
        // miss if not equal
        ++dmc->cs.r_misses;
        // check dirty bit
        if (cacheline != NULL && dmc->dirty_bits[index] == true){
            // if dirty, writeback
            mm_write(dmc->mm, cacheline->start_addr, cacheline);
        }

        // evect via overrwite
        if(cacheline != NULL){
            mb_free(cacheline);
        }
        cacheline = mm_read(dmc->mm, mb_start_addr);
        dmc->dirty_bits[index] = false;
        dmc->cache[index] = cacheline;
        mb_addr = cacheline->data + addr_offt;
        result = *mb_addr;
    }

    // Update statistics
    ++dmc->cs.r_queries;
    return result;
}

void dmc_free(direct_mapped_cache* dmc)
{
    for(int i = 0; i < DIRECT_MAPPED_NUM_SETS; i++){
        if (dmc->cache[i] != NULL){
            mb_free(dmc->cache[i]);
        }
    }
    free(dmc);
}