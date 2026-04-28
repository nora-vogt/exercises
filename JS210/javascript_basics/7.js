/* 

Convert a String to a Number

For this exercise we're going to learn more about type conversion by implementing our own parseInt function that converts a string of numeric characters (including an optional plus or minus sign) to a number.

The function takes a string of digits as an argument, and returns the appropriate number. Do not use any of the built-in functions for converting a string to a number type.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

- create an object where the key is a string digit and the value is a number
- create a value variable set to 1
- iterate through chars of the string
  - for each char, get the corresponding digit
  - multiply value by 10 and add the current digit
  - reassign value to that result

Take each digit and add it to 10 times the previously calculated value
  10 * 0 + 4  --> 4
  10 * 4 + 3  --> 43
  10 * 43 + 1 --> 431
*/

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

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570
