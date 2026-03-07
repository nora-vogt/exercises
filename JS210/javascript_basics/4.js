/* String Assignment 
Take a look at the following code:
*/

let myName = 'Bob';
const saveName = myName;
myName = 'Alice';
console.log(myName, saveName); // logs Alice Bob


// Now this code

const myName = 'Bob';
const saveName = myName;
myName.toUpperCase(); // returns BOB
console.log(myName, saveName);

/*
This code logs Bob Bob

On line 13, the constant `myName` is initialized to `'Bob'`. On line 14, the constant `saveName` is initialized to a copy of the string 'Bob'. It's assigned the same string value because strings are primitives, which are immutable.

On line 15, toUpperCase is called on `myName,` returning an upcased string `'BOB'`, but nothing is logged. Strings can't be mutated, so this method simply returns a new string

Finally, the values of `myName` and `saveName` are logged, and `Bob Bob` is output.

Further exploration:

When a method is called on a primitive, JavaScript temporarily wraps it in an object so that you can use that object's prototype methods.

console.log('Bob'.toUpperCase()); // BOB

is equivalent to:

console.log(new String('Bob').toUpperCase()); // BOB

*/ 
