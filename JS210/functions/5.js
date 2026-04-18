function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);

/* This code will log `This is global.`

On line 5, `someFunction` is executed. This function assigns the variable `myVar` to the string 'This is global'. Since `myVar` is assigned without being declared with a `const`, `let`, or `var` keyword, JavaScript binds `myVar` to be a property of the global object - making it accessible anywhere in the program.

Normally, variables declared within the inner scope of a function body are not accesible in the outer scope, but because there is no declaration keyword, JavaScript doesn't treat `myVar` as a local variable. Instead, it ends up on the global object, so console.log(myVar) can access it. */
