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
    .word TEST_ALL


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

    /* Enter your code above this comment */
    ret

.global asm_cmp
asm_cmp:
    // int asm_cmp(const void * a, const void * b)
    // Compare function to int32_t
    // used for qsort
    /* Enter your code after this comment */

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

    /* Enter your code above this comment */
    ret

.global asm_fib
asm_fib:
    /* uint32_t asm_fib(uint32_t n)
     * accept an index term `n` and return 
     * the Fn fibonacci term (F0 = 0, F1 = 1)
     **/

    /* Enter your code after this comment */

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
