var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();

/* 
This wil log `'This is global'`. The global variable `myVar` is declared and initialized on line 1 to the string 'This is global'.

The function `someFunction` is defined on lines 3-5. This function simply logs the value of `myVar`. Since variables declared in the outer scope are accessible in the inner scope of the function body, this code logs 'This is global' when `someFunction` is invoked on line 7.

When console.log tries to log the value of `myVar`, JavaScript first attempts to find the variable in the current scope of the function body. Not finding it, JavaScript moves to the next outer scope, which is the global scope. It finds the global `myVar` and logs its value.

*/
