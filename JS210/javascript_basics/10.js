/* 
Convert a Signed Number to a String
In the previous exercise, you reimplemented a function that converts non-negative numbers to strings. In this exercise, you're going to extend that function by adding the ability to represent negative numbers.

You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. You may, however, use the integerToString function from the previous exercise.

- check if the number is negative
  - if yes, set isNegative to true
- use integerToString to convert, pass in the absolute value of number
- if isNegative, return string with '-' concatenated to beginning, otherwise return the string

*/

const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

function integerToString(number) {
  let result = '';

  do {
    let remainder = number % 10;
    number = Math.floor(number / 10);

    result = DIGITS[remainder] + result;
  } while (number > 0);

  return result;
}

function signedIntegerToString(number) {
  let isNegative =  number < 0 || Object.is(number, -0);
  let numberString = integerToString(Math.abs(number));

  return isNegative? '-' + numberString : numberString;
}

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"
console.log(signedIntegerToString(-0));// === "-0"); // This returns false, because our initial check to determine if the number is negative relies on it being less than zero and does not account for negative zero. To fix it, we can add a condition to account for negative zero. 
