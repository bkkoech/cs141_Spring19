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
            result->lru_count[i][j] = 0;
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
    for (int i = 0; i < SET_ASSOCIATIVE_NUM_SETS; i++){
        for (int j = 0; j < SET_ASSOCIATIVE_NUM_WAYS; j++){
            if (i == set && j == way){
                sac->lru_count[i][j] = 0;
            }
            else {
                if (sac->lru_count[i][j] != 2147483646) // check overflow
                    sac->lru_count[i][j]++;
            }
        }
    }
}

static int lru(set_associative_cache* sac, int set)
{
    // return the way of the lru
    int lru = 0;
    int result = 0;

    for (int i = 0; i < SET_ASSOCIATIVE_NUM_WAYS; i++){
        if (lru < sac->lru_count[set][i]){
            lru = sac->lru_count[set][i];
            result = i;
        }
    }
    return result;
}

void sac_store_word(set_associative_cache* sac, void* addr, unsigned int val)
{
    // TODO
}


unsigned int sac_load_word(set_associative_cache* sac, void* addr)
{
    // TODO
    return 0;
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