/*
 * CS:APP Ch1-6 Project (Phases 1–3 only)
 * This program covers binary file I/O 
 * heap allocation, safe string handling, and simple cache-locality benchmarking (Ch5–6).
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#pragma pack(push, 1)
typedef struct {
    int32_t id;
    uint8_t grade;
    char status;
    uint16_t _pad;
    char name[24];
} Record;

#pragma pack(pop)
typedef struct {
    Record *items;
    size_t  count;
} RecordArray;

int load_records(const char *path, RecordArray *out) {
  /* Your Code Here: read 10 binary records from
     the argument(path) given into argument array (out)
     return 0 when success */
}

int save_records(const char *path, const RecordArray *arr) {
  /* Save the records you load in (arr) in the above function
     into a binary file and save it in path
     return 0 upon sucess */
}

int cmp_id(const void *a, const void *b) {
  /* Expalin what does this function do line by line*/
  const Record *ra = (const Record*)a;
  const Record *rb = (const Record*)b;
  return (ra->id > rb->id) - (ra->id < rb->id);
}


int main(void) {
    RecordArray arr = {0};
    if (load_records("records.bin", &arr) != 0) {
        fprintf(stderr, "Failed to load records.bin\n");
        return 1;
    }

    // Safe string handling (keep names null-terminated within 24 bytes)
    for (size_t i = 0; i < arr.count; ++i) {
        arr.items[i].name[sizeof(arr.items[i].name)-1] = '\0';
    }

    // Cache-locality microbenchmark
    clock_t t1, t2;
    volatile int sum = 0;

    t1 = clock();
    for (size_t i = 0; i < arr.count; ++i) {
        sum += arr.items[i].grade;
    }
    t2 = clock();
    double contiguous_ms = 1000.0 * (t2 - t1) / CLOCKS_PER_SEC;

    const size_t k = 3;
    t1 = clock();
    for (size_t off = 0; off < k; ++off) {
        for (size_t i = off; i < arr.count; i += k) {
            sum += arr.items[i].grade;
        }
    }
    t2 = clock();
    double strided_ms = 1000.0 * (t2 - t1) / CLOCKS_PER_SEC;

    // Sort by id to show a different access pattern and write it out
    qsort(arr.items, arr.count, sizeof(Record), cmp_id);
    if (save_records("records_sorted.bin", &arr) != 0) {
        fprintf(stderr, "Failed to save records_sorted.bin\n");
    }

    printf("Records: %zu\nContiguous access: %.3f ms\nStrided access:    %.3f ms\nSum=%d (ignore)\n",
           arr.count, contiguous_ms, strided_ms, sum);

    free(arr.items);
    return 0;
}
