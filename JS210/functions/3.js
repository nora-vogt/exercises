var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);


/* This code logs `'This is local'`. 
The global variable `myVar` is declared and initialized on line 1 to the string 'This is global'. 

`someFunction` is invoked on line 7. This function reassigns `myVar` to the string 'This is local'. Variables declared in the outer, global scope are accessible within the inner scope of the function body. 

That new value is logged on line 8.


Other student answer - mentions hoisting:
When this program is parsed by the javascript engine, it creates a variable in the global execution context called myVar and set it to undefined. It also creates a function someFunction() that simply resides in memory until called.

When the program executes, first the global myVar is set to This is global. Then someFunction() is called. This will create a local execution context for the function. The code of the function sets the myVar to This is local. Since there is no myVar defined in the local scope of the function, javascript looks for the definition of the variable further up the scope chain. The next available scope is the global scope. Since myVar is declared there, the value of this variable is set to This is local. This illustrates the notion that inner scopes have access to everything in their outer scope.

The program then executes the console.log statement, returning This is local. 
*/
