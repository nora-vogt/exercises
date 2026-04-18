var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();

/* 
This will log `'This is local``. On line 1, a `myVar` is declared and initialized to the string `'This is global'`. 

The `someFunction` function is defined on lines 3-6. Within the body of this function, a different variable called `myVar` is declared and initialized locally within the inner scope of the function body to the string `'This is local'`. 

When console.log(myVar) runs inside someFunction, JavaScript first looks for myVar in the local function scope, finds the local `myVar`, and logs 'This is local'. It will output the value of the `myVar` declared on line 4 when `someFunction` is executed on line 8.

Because the local `myVar` has the same name as the global variable declared on line 1, the global `myVar` is inaccessible within the `someFunction` body. This is an example of variable shadowing. 


Helpful notes from other student solutions:
JavaScript using lexical scope to resolve variables it encounters.

This means when console.log(myVar) is invoked on line 5, JavaScript first looks for the variable myVar in the local scope, if it's not found JavaScript will continue searching the next outer scope and so on...
*/
