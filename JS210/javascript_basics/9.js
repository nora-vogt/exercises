/*
Convert a Number to a String
In the previous two exercises, you developed functions that convert simple numeric strings to signed integers. In this exercise and the next, you're going to reverse those functions.

You will learn more about converting strings to numbers by writing a function that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. Your function should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

- create a DIGITS array, containing the string digits 0-9
- create empty numberString
- get each digit of the number
  - Take the remainder of the number when diving by 10
    - use that value as index in DIGITS array, push to numberSTring
- operate on the number to remove the last digit
  - divide by 10 and use Math.floor to round the result down
- repeat above until number is 0
*/

const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

// function integerToString(integer) {
//   if (integer === 0) {
//     return '0';
//   }

//   let numberString = '';

//   while (integer > 0) {
//     let digit = integer % 10;
//     numberString = DIGITS[digit] + numberString;
//     integer = Math.floor(integer / 10);
//   }

//   return numberString;
// }

// LS Solution
// Better implementation than a guard clause - it will always run at least once, so it will handle 0

function integerToString(number) {
  let result = '';

  do {
    let remainder = number % 10;
    number = Math.floor(number / 10);

    result = DIGITS[remainder] + result;
  } while (number > 0);

  return result;
}

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"
