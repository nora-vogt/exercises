console.log(a);

var a = 1;

/* 
This code will log `undefined` due to variable hoisting. In the creation phase, the JavaScript engine hoists the declaration of the variable `a`. Since the `var` keyword was used, `a` initially has a value of `undefined`. The value of `a` is logged on line 1 before the value is initialized on line 3, so `undefined` is logged. 

LSsBot corrections:
This code logs undefined. During the initial pass (creation phase), the JavaScript engine hoists the var a declaration to the top of its scope and initializes a to undefined. When console.log(a) executes, the assignment a = 1 hasn’t run yet, so a still has the value undefined, which is what gets logged.

This behavior depends on using the var keyword. During hoisting, var a; is not only declared but also initialized with the value undefined, which is why console.log(a); outputs undefined instead of raising an error.

If we rewrote the example using let or const:

console.log(a);
let a = 1;

or:

console.log(a);
const a = 1;

the code would throw a ReferenceError. Although let and const declarations are also hoisted, they are not initialized to undefined before their declaration line runs. Accessing them before that point (while they are in the “temporal dead zone”) is not allowed. This is why var gives undefined here, while let and const would cause an error instead.


Student Answer:
This program will log undefined. This is an example of variable hoisting. This means that when the program is loaded into memory, the variable a is declared in the global execution context and set to the value undefined. Then, when the program executes, the statements are executed one at a time from top to bottom. So the console.log statement will log undefined. Then the variable a is set to 1.

This would be as if we wrote the program as such:

var a;
console.log(a);
a = 1;

Note however that javascript doesn't actually move the code around in this way. What is actually happening is that there are two distinct phases. In a creation phase, all of the variables are declared in memory and set to undefined. In the execution phase, the program is executed line by line.

*/
