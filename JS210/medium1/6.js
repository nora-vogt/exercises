function debugIt() {
  const status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

/*
Logger
Read through the following code. Why will it log 'debugging'?

This code logs `debugging` because the `logger` function creates a closure that retains a reference to the `status` constant declared on line 2. 

When `debugIt` isinvoked on line 10, the `logger` function is called, and the value of `status` is logged to the screen. Even though `status` is not declared within the body of the `logger` function, the function still has access to the variable due to its closure.


LS frames the answer more in terms of lexical scoping: Due to JavaScript's lexical scoping rules, the inner `logger` function has access to the variables declared in the outer scope of the parent `debugIt` function.
*/
