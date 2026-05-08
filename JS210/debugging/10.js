const totalPages = 364;
let energy = 100;
let currentPage = 1;

function read() {
  while (energy > 0 && currentPage < totalPages) {
    currentPage += 1;
    energy -= (5 + currentPage * 0.1);
  }

  console.log(`Made it to page ${String(currentPage)}.`);

  // Drink a cup of coffee.
  energy = 100;

  // Continue reading.
  if (currentPage < totalPages) {
    read();
  } else {
    console.log('Done!');
  }
}

read();

/* 
Stuck on Page 18
The above code is a simplified (and not so serious) model of how we read a software development book. But running this code results in a stack overflow. What is wrong?

This code is running into an issue becuase `let currentPage = 1` is declared on line 1 of the `read()` function, instead of outside the function in the global scope. 

The `while` loops reads 18 pages before our `energy` is depleted. After `while` finishes executing, `currentPage` has a value of `18`. 

`  if (currentPage < totalPages)` evaluates as true, so the `if` block is executed, and the `read()` function is called again. This resets the value of `currentPage` to `1`, meaning that we continually read the first 18 pages. There is no opportunity to read the subsequent pages. 

To fix this, we need to move the initialization of `currentPage` to line 3, so that its value is not reset each time we drink a cup of coffee to replenish `energy` and continue reading.

LS Language suggestion: Therefore, the comparison provided as a condition to our if statement on line 18 of the original code will always return true and read will continue to be invoked repeatedly until the stack overflows.
*/
