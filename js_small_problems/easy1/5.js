/* Sum or Product of Consecutive Integers 

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or the product of all numbers between 1 and the entered integer, inclusive.

Examples:
Please enter an integer greater than 0: 5
Enter "s" to compute the sum, or "p" to compute the product. s

The sum of the integers between 1 and 5 is 15.

Please enter an integer greater than 0: 6
Enter "s" to compute the sum, or "p" to compute the product. p

The product of the integers between 1 and 6 is 720.

ALGORITHM:
- declare an integer variable
- start a loop
  - Ask the user to enter an integer, assign to intger
  - convert integer to a number
  - break if number is greater than 0
  - log an error message - user must enter integer greater than 0

- declare an operation variable
- start a loop
  - ask the user if they want to compute sum or product
  - assign operation to result
  - break if operation is equal to 's' or 'p'
  - log error message and get input again

- declare a result variable to 1
- loop from 2 to integer, inclusive
  - if operation is sum
    - increment result by adding current number
  - if operation is product
    - increment result by multiplying current number

- log the result string
*/

// function computeSum(number) {
//   let result = 0;
//   for (let i = 1; i <= number; i += 1) {
//     result += i;
//   }
//   return result;
// }

// function computeProduct(number) {
//   let result = 1;

//   for (let i = 1; i <= number; i += 1) {
//     result *= i;
//   }

//   return result;
// }

// let integer;
// while (true) {
//   integer = parseInt(prompt('Enter an integer greater than 0: '));
//   if (integer > 0) {
//     break;
//   }

//   console.log('Must enter an integer greater than 0.')
// }

// console.log(integer);

// let operation;
// while (true) {
//   operation = prompt('Enter "s" to compute the sum, or "p" to compute the product: ').toLowerCase();
//   if (operation === 's' || operation === 'p') {
//     break;
//   }
//   console.log('Must enter "s" or "p".')
// }

// let result;
// if (operation === 's') {
//   result = computeSum(integer);
// } else if (operation === 'p') {
//   result = computeProduct(integer);
// }

// operation = operation === 's' ? 'sum' : 'product';

// console.log(`The ${operation} of the integers between 1 and ${integer} is ${result}.`)

/* Further Exploration 

What if the input was an array of integers instead of just a single integer? How would your computeSum and computeProduct functions change? Given that the input is an array, how might you make use of the Array.prototype.reduce() method?

- Ask user to enter an array of integers
- modify computeSum and computeProduct to use reduce();
*/

function computeSum(array) {
  return array.reduce((sum, number) => sum + number);
}

function computeProduct(array) {
  return array.reduce((product, number) => product * number);
}
