#include <stdint.h>
#include <stdbool.h>

#include "memory_block.h"
#include "direct_mapped.h"

direct_mapped_cache* dmc_init(main_memory* mm)
{
    // TODO
    direct_mapped_cache* result = malloc(sizeof(direct_mapped_cache));
    result->mm = mm;
    result->cs = cs_init();
    // set dirty bits to 0
    for(int i = 0; i < DIRECT_MAPPED_NUM_SETS; i++){ 
        result->dirty_bits[i] = false;
    }
    return result;
}

static int addr_to_set(void* addr)
{
    uint16_t result = ((int)addr >> MAIN_MEMORY_BLOCK_SIZE_LN);
    result = result & DIRECT_MAPPED_NUM_SETS_LN-1;
    return result;
}


void dmc_store_word(direct_mapped_cache* dmc, void* addr, unsigned int val)
{
    // Precompute start address of memory block
    size_t addr_offt = (size_t) (addr - MAIN_MEMORY_START_ADDR) % MAIN_MEMORY_BLOCK_SIZE;
    void* mb_start_addr = addr - addr_offt;

    // get cache index for block
    int index = addr_to_set(mb_start_addr); 
    memory_block* cacheline = dmc->cache[index];

    // Check addresses are equal
    if(cacheline->start_addr == mb_start_addr){
        // if equal, update cache line, set dirty bit to true
        unsigned int* mb_addr = cacheline->data + addr_offt;
        *mb_addr = val;
        dmc->dirty_bits[index] = true;
    }
    else {
        // if not equal, need to evcit, check dirty bit
        if(dmc->dirty_bits[index] == true){
            // if dirty bit true, write to memory and overrwite
            mm_write(dmc->mm, mb_start_addr, cacheline);
            unsigned int* mb_addr = cacheline->data + addr_offt;
            *mb_addr = val;
        }
        else {
            // if dirty bit false, overrwite
            unsigned int* mb_addr = cacheline->data + addr_offt;
            *mb_addr = val;
        }
    }

    // Update statistics
    ++dmc->cs.w_queries;
    ++dmc->cs.w_misses;
}

unsigned int dmc_load_word(direct_mapped_cache* dmc, void* addr)
{   
    // TODO
    
    return 0;
}

void dmc_free(direct_mapped_cache* dmc)
{
    for(int i = 0; i < DIRECT_MAPPED_NUM_SETS; i++){
        free(dmc->cache[i]);
    }
    free(dmc);
}