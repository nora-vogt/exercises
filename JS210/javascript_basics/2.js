const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello');
}

if (!myString) {
  console.log('World');
}

if (!!myArray) {
  console.log('World');
}


if (myOtherString || myArray) {
  console.log('!');
}

/* Conditionals Part 1 

Go over the following program. What does it log to the console at lines 7, 11, 15, and 19? Is it what you expected? Why or why not?

Line 7 will log `'Hello'`, because the value of `myBoolean` is `true`, so the `if` statement on line 6 will execute the branch. 

On line 10, the condition `!myString` is evaluated. Since myString is assigned to a string with a value, which is truthy, this returns false. The condition evaluates as false so the branch does not execute and nothing is logged.

On line 14, `!!myArray` is evaluated as the condition for an `if` statement. `!!` will return the boolean equivalent of the argument. Empty arrays are truthy, so this returns `true`, and the `if` branch executes loggging `'World'` to the console.

On line 18, the condition `myOtherString || myArray` is evaluated. The value of `myOtherString` is an empty string, which evaluates as falsy. So `||` continues to evaluate `myArray`, which references an empty array, which is truthy. This condition evaluates as `true`, so `'!'` is logged. 

Summary of what is logged:
Line 7: Hello
Line 11: (nothing)
Line 15: World
Line 19: !
*/
