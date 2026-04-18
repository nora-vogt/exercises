let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;

myArray.pop();
console.log(myArray);
console.log(myOtherArray);

myArray = [1, 2];
console.log(myArray);
console.log(myOtherArray);

/* Read through the code shown above. What does it log to the console at lines 5, 6, 9, and 10?

On line 1, we declare and initialize `myArray` to `[1, 2, 3, 4]`. On line 2, we declare and initialize `myOtherArray` to the value of `myArray`. 

At this point, we have two variables each pointing to the same Array object stored in memory. When line 4 calls `pop` on this array through `myArray`, the last valus is removed and returned, mutating that array. 

Line 5 logs `[ 1, 2, 3]`. Since `myOtherArray` references the same array that `myArray` references, that change is also reflected on line 6 when logging the value of `myOtherArray` - `[ 1, 2, 3 ].

On line 8, we reassign `myArray` to a new array with the value `[1, 2]`. This changes the pointer stored in `myArray`, but it does not reassign `myOtherArray`.

Now, line 9 logs `[ 1, 2 ]` when logging the value of `myArray`, while `myOtherArray` still references the original array, `[ 1, 2, 3]`.


Language tips: Reassignments of variables never mutate the value or object originally referenced by that variable. The reassignment also does not change any other variable that might be referencing the original item.
*/
