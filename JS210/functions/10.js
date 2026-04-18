// logValue();

// function logValue() {
//   console.log('Hello, world!');
// }

/* 

In the creation phase, the JavaScript engine hoists function declarations - including the name and body before the program executes. This allows the `logValue` function to execute on line 1 even though this code comes before the written function definition on lines 3-5.

LSBot Revised version: During the creation phase, the JavaScript engine hoists function declarations, including both the function name and its body. This means the logValue function is fully defined before any code is executed, so the call to logValue() on line 1 works even though the function declaration appears later in the source code on lines 3–5.
*/

//Further Exploration:
var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);
/* Let's refactor the code a bit. What does it log now? What is the hoisted equivalent of this code?

function logValue() {
  console.log('Hello, world!');
}

logValue = 'foo';

console.log(typeof logValue);


Student answer:
In the hoisting process, functions declarations take precedence over variable declarations. This means that function declarations are moved to the top of the scope before variable declarations.

When we have a function declaration and a variable declaration with the same name, as happens here, the variable declaration is omitted because it becomes redundant. JavaScript lets the assignment, which is actually a reassignment.

The hoisted equivalent code would be:

function logValue() {
  console.log('Hello, world!');
}

logValue = 'foo';

console.log(typeof logValue);  // => "string"

We can see that at the beginning the variable logValue holds a function but later is reassigned to a string value. Then the console logs the typeof logValue, and in that moment is a string.
*/
