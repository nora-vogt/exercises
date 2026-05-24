/* 
Uppercase Check
Write a function that takes a string argument and returns true if all of the alphabetic characters inside the string are uppercase; otherwise, return false. Ignore characters that are not alphabetic.

ALGORITHM
- delete non-alphabetic characters from string
- check if all remaining characters are uppercase
  - compare the modified string to an upcased version of that string, are the values equal?
- actually don't even need to delete! teh string will be unaffected by non-alpha chars when calling toUpperCase

  
LS Solution:
- Use RegExp.prototype.test method to determine if there are any lowercase letters in the string arg, then uses logical NOT to reverse the boolean so the function returns false if there are lowercase letters

*/

function isUppercase(string) {
  // let alphaCharsOnly = string.replace(/[^a-z]/gi, '');
  return alphaCharsOnly == alphaCharsOnly.toUpperCase();
}

// LS
function isUppercase(string) {
  return !/[a-z]/.test(string);
}

console.log(isUppercase('t'));               // false
console.log(isUppercase('T'));               // true
console.log(isUppercase('Four Score'));      // false
console.log(isUppercase('FOUR SCORE'));      // true
console.log(isUppercase('4SCORE!'));         // true
console.log(isUppercase(''));                // true
