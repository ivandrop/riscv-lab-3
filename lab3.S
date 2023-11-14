// Lab 3 template file
.data

.global login_name
login_name:
    .asciz "iandreop"

.global puid
puid:
    .asciz "0033426341"

.balign 4

.equ TEST_SORT,         0x1
.equ TEST_STRCONCAT,    0x2
.equ TEST_FIB,          0x4
.equ TEST_BSEARCH,      0x8
.equ TEST_ALL,          (TEST_SORT | TEST_STRCONCAT | TEST_FIB | TEST_BSEARCH)

// Replace the TEST_ALL with the tests you want to run
// OR expression also support like the TEST_ALL above
// i.e. replace the TEST_ALL below with TEST_SORT | TEST_STRCONCAT
//      will test on the sort and strconcat
.global test
test:
    .word TEST_BSEARCH


// Align to 4bytes boundary as we have a string above
.balign 4

.text
.global asm_sort_int
asm_sort_int:
    /* void asm_sort_int(int32_t* arr, uint32_t n)
     * relies on `qsort` in C standard library to 
     * sort in ascending order
     **/

    /* Enter your code after this comment */

    // Store return address
    addi x2, x2, -32
    sw x1, 0(x2)

    li x12, 4  // Size of elements
    la x13, asm_cmp  // Compare function label address    
    jal x1, qsort  // Call quicksort

    // Load return address
    lw x1, 0(x2)
    addi x2, x2, 32

    /* Enter your code above this comment */
    ret

.global asm_cmp
asm_cmp:
    // int asm_cmp(const void * a, const void * b)
    // Compare function to int32_t
    // used for qsort
    /* Enter your code after this comment */
    
    // Check if a < b
    lw x28, 0(x10)
    lw x29, 0(x11)
    blt x28, x29, _case_1 
    
    // if a >= b, return 1
    li x10, 1
    ret

    // If a < b, return -1
    _case_1:
        li x10, -1
        ret

    /* Enter your code above this comment */
    ret

.global asm_strconcat
asm_strconcat:
    /* char* asm_strconcat(char * str1, char * str2)
     * First assign memory space with `malloc`, 
     * concatenating `str1` and `str2`, 
     * and return the resulted string.
     **/
    /* Enter your code after this comment */

    // Move Arguments to Stack
    addi x2, x2, -32
    sw x1, 0(x2)
    sw x10, 4(x2)  // str1
    sw x11, 8(x2)  // str2

    // String Length (str1)
    lw x10, 4(x2)
    jal x1, strlen
    sw x10, 12(x2)  // n1

    // String Length (str1)
    lw x10, 8(x2)
    jal x1, strlen
    sw x10, 16(x2)  // n2

    // Allocate Space
    lw x5, 12(x2)
    lw x6, 16(x2)
    add x10, x5, x6
    addi x10, x10, 1  // size = n1 + n2 + 1
    sw x10, 20(x2)  // size
    jal x1, malloc
    sw x10, 24(x2)  // buf

    // Copy Memory (str1)
    lw x10, 24(x2)
    lw x11, 4(x2)
    lw x12, 12(x2)
    jal x1, memcpy
    
    // Copy Memory (str1)
    lw x10, 24(x2)
    lw x7, 12(x2)
    add x10, x10, x7  // buf + n1
    lw x11, 8(x2)
    lw x12, 16(x2)
    jal x1, memcpy

    // Write Null Terminator
    lw x10, 24(x2)
    lw x28, 20(x2)
    add x10, x10, x28  // buf + size
    addi x10, x10, -1  // buf + size - 1
    sb x0, 0(x10)

    // Return Stack Arguments
    lw x1, 0(x2)
    lw x10, 24(x2)
    addi x2, x2, 32
    
    /* Enter your code above this comment */
    ret

.global asm_fib
asm_fib:
    /* uint32_t asm_fib(uint32_t n)
     * accept an index term `n` and return 
     * the Fn fibonacci term (F0 = 0, F1 = 1)
     **/

    /* Enter your code after this comment */
    
    // Move Arguments to Stack
    addi x2, x2, -32
    sw x1, 0(x2)
    sw x10, 4(x2)

    // Base Case: n < 2
    li x28, 2
    blt x10, x28, _base_case

    // Fn - 1 Term
    addi x10, x10, -1
    jal x1, asm_fib
    sw x10, 8(x2)

    // Fn - 2 Term
    lw x10, 4(x2)
    addi x10, x10, -2
    jal x1, asm_fib

    // Return (Fn - 1) + (Fn - 2)
    lw x29, 8(sp)
    add x10, x10, x29

    // Load Stack Arguments
    lw x1, 0(sp)
    addi x2, x2, 32
    ret

    // Base Case
    _base_case:
        lw x10, 4(x2)
        lw x1, 0(x2)
        addi x2, x2, 32
        ret

    /* Enter your code above this comment */
    ret

.global asm_bsearch
asm_bsearch:
    /* int32_t asm_bsearch(int *arr, int key, 
                    int32_t start,
                    int32_t end)
     * Return the index of the element in the array
     * if the element does not exist, return -1 instead
     * arr: integer array to be searched
     * key: the element we want to search on
     * start: start index of subarray, inclusive
     * end: end index of subarray, inclusiveloop through an entire string and only convert
     **/

    /* Enter your code after this comment */



    /* Enter your code above this comment */
    ret
