var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

/* 
Local vs Global Part 1

What will the following code log to the console and why? Don't run the code until after you have tried to answer.

This code will log 'This is global.' On line 1, `myVar` is declared and initialized to the string 'This is global'. On lines 3-5, `someFunction()` is defined. Within the function body, a new variable `myVar` is declared with the `var` keyword and initialized to the string 'This is local'.

The `myVar` declared on line 4 is a second, separate variable that is scoped locally to the function body.

On line 7, `someFunction()` is invoked, which declares and initializes the function-scoped `myVar`. That assignment does not affect the value of the globally scoped `myVar`, and its original value is logged on line 8.

LS Answer:
  JavaScript uses lexical scope. This means that it determines the scope of a variable by the structure of the program. This program declares a variable named myVar in two places. The first is outside of any function, giving the first myVar a global scope. The second place is inside of someFunction. Functions in JavaScript create a new scope — a scope that is "local" to the function. This local scope is also referred to as an "inner" scope in relation to the global "outer" scope.

  On line 8, console.log(myVar) logs "This is global" because the two myVar variables, on lines 1 and 4, belong to different scopes. someFunction has its own local "inner" scope, so the myVar declaration within the function has no effect on the global "outer" scope.

*/
