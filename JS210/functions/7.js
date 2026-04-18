let a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);

/* 

This code logs `7`. 

The variable `a` is declared an initialized on line 1 to `7`. When the function `myValue` is invoked on line 7, `a` is passed in as an argument using pass by value, so a copy of the value is passed in rather than a reference to the original variable. 

The `myValue` function is defined with one parameter, `a`. This parameter has the same name as the `a` declared in the outer scope, so the variable `a` that is local to the function body blocks access to the outer scoped `a`. 

This local variable `a` is reassigned on line 4, but nothing more is done with that value, and the local `a` is not accessible after `myValue` finishes executing. 

Line 8 logs the value of the `a` declared on line 1, which is unchanged.

*/
