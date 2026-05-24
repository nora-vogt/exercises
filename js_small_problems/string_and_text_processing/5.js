/*
Swap Case

Write a function that takes a string as an argument and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.

create a new empty string
iterate through argument string
  if current char is uppercase
    push lowercase char to empty string
  otherwise
    push uppercase char to empty string

this works and handles non-letter chars, but that's an edge case to be aware of
*/

function isUpperCase(letter) {
  return letter.toUpperCase() === letter;
}

function swapCase(string) {
  return string.split('').reduce((result, letter) => {
    if (isUpperCase(letter)) {
      return result += letter.toLowerCase();
    } else {
      return result += letter.toUpperCase();
    }
  }, '');
}

/* LS Solution using regex to check uppercase/lowercase */

function swapCase(string) {
  return string.split('').map(char => {
    if (/[a-z]/.test(char)) {
      return char.toUpperCase();
    } else if (/[A-Z]/.test(char)) {
      return char.toLowerCase();
    } else {
      return char;
    }
  }).join('');
}

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"
