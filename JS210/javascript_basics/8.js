/* 
Convert a String to a Signed Number

The previous exercise mimics the parseInt function to a lesser extent. In this exercise, you're going to extend that function to work with signed numbers.

Write a function that takes a string of digits and returns the appropriate number as an integer. The string may have a leading + or - sign; if the first character is a +, your function should return a positive number; if it is a -, your function should return a negative number. If there is no sign, return a positive number.

You may assume the string will always contain a valid number.

RULES
- first char is the sign

ALGO:
- split string into an array of chars
- remove first char from array
- if char is -, set isNegative to true
- use same signedInt function

- check if isNegative is true
  - if yes, multiply value by -1 and return
  - if no, return value

*/

const DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, 
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
}

function stringToInteger(string) {
  const DIGITS = {
    '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, 
    '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
  }

  let value = 0;
  for (let index = 0; index < string.length; index += 1) {
    let number = DIGITS[string[index]];
    value = value * 10 + number;
  }
  return value;
}

// slice(1) returns a new string containing all chars starting at index 1 up to and including the last char of the calling string

function stringToSignedInteger(string) {
  switch (string[0]) {
    case '-': return -stringToInteger(string.slice(1));
    case '+': return stringToInteger(string.slice(1));
    default:  return stringToInteger(string);
  }
}

// original
// function stringToSignedInteger(string) {
//   let numbers = string.split('');
//   let isNegative = numbers.shift() === '-'

//   let value = 0;
//   for (let index = 0; index < numbers.length; index += 1) {
//     let number = DIGITS[numbers[index]];
//     value = value * 10 + number;
//   }

//   return isNegative ? -value : value;
// }

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100

// Fun student solution, use regex and String.prototype.replace to remove a leading sign, then just check the value of the first char of the string:

// function stringToSignedInteger(string) {
//   let numStr = string.replace(/^[+-]/, '');
//   let number = stringToInteger(string);

//   return string[0] === '-' ? -number : number;
// }
