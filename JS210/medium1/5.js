// Counter 
// What will the following code snippets log?

// Code Snippet 1
// var counter = 5;
// var rate = 3;
// console.log('The total value is ' + String(counter * rate));

// function counter(count) {
//   // ...
// }

/* 
This will log `'The total value is 15`. This code declares a variable and a function with the same name, `counter`. Due to hoisting, the function declaration and definition are hoisted above any variable declarations. So while `counter` initially references the function `counter()`, it is reassigned to `5` by line 5. 

This allows the multiplication to successfully execute in the template literal.
*/

// Code Snippet 2
// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// var counter = 5;
// var rate = 3;

/* 
This code will log `'The total value is NaN`. 

At the time `counter` is referenced in the template literal, it points to the function `counter`. `rate` has a value of `undefined`. This is due to variable hoisting: the function name and definition has been hoisted and is accessible, but only the variable declaration `rate` has been hoisted; it does not yet have a value. Attempting to multiply the function by undefined returns NaN.
*/

// Code Snippet 3
// var counter = 5;
// var rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

/* 
After hoisting, this code looks like:
function counter(count) {
  // ...
}
var counter;
var rate;
counter = 5;
rate = 3;

console.log('The total value is ' + String(counter * rate));

`counter` has a value of `5` when `console.log` is executed, and `rate` has a value of `3`, so the multiplication returns `15` and `The total value is 15` is logged.
*/

// Code Snippet 4
let counter = 5;
let rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

/* 
After hoisting, this code looks like:
function counter(count) {
  // ...
}
let counter; // temporal dead zone, no value
let rate; // temporal dead zone

counter = 5;
rate = 3;



*/
