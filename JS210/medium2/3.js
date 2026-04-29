let startingBalance = 1;
const chicken = 5;
const chickenQuantity = 7;

function totalPayable(item, quantity) {
  return startingBalance + (item * quantity); // 5 + 35
}

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity)); // 40

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity)); // 45

/* 
Amount Payable
What does the following code log? Why is this so? 

The `console.log` statement on line 10 logs `40`. It logs the return value of the `totalPayable` function, which is called passing in `chicken` and `chickenQuantity` as arguments. These variables have values of `5` and `7`, respectively. 

Within the function, the `startingBalance` variable declared on line 1 in the global scope is accessible in the function body due to JavaScript's lexical scoping rules. `startingBalance` has been reassigned to `5` on line 9. This allows the calculation `5 + (5 * 7)` to be evaluated, and `40` is returned by the function. 

The same thing happens with the `console.log` statement on line 13, except `startingBalance` has been reassigned to `10`. `totalPayable` returns `45`, which is then logged.

LS Additional notes:
- bring in closures for this explanation:

Closures are functions that "retain access" to variables defined in an "enclosing scope". In the code above, the enclosing scope is the global (window) scope containing the variables startingBalance, chicken, and chickenQuantity. Retaining access means that a variable's value is not fixed at the time when the function is defined or first executed. Instead, the variable's value is dynamically looked up each time the function is called. Therefore, the value of startingBalance on line 6 is not 1; instead, the value is a reference to the value stored in the startingBalance variable in the global scope.

As a result of how closures work, the first time the totalPayable function is called, the value of startingBalance is 5; the second time the function is called, the value of startingBalance is 10.

*/
