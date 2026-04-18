let a = [1, 2, 3];

function myValue(b) {
  b[2] += 7; // b[2] = b[2] + 7
}

myValue(a);
console.log(a);

/* 
This code logs `[ 1, 2, 10 ]`

`a` is declared and initialized on line 1 to the array `[1, 2, 3]`. 

`myValue` is invoked on line 7, and `a` is passed in as an argument. Since the value of `a` is a reference type, a copy of the reference is assigned to the function parameter `b`, and both variables point to the same array in memory. 

Within the `myValue` function, index position `2` of the array referenced by `b` is reassigned to the result of `b[2] + 7`, which is `10`. This reassignment mutates the array, and the new value of the array is `[1, 2, 10]`.

Since `b` and `a` point to the same array, this updated value will be reflected when referencing `a` after the `myValue` function finishes executing. That value is logged by line 8.

*/
