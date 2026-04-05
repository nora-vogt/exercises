/* 
UTF-16 String Value

Write a function that determines and returns the UTF-16 string value of a string passed in as an argument. The UTF-16 string value is the sum of the UTF-16 values of every character in the string. (You may use String.prototype.charCodeAt() to determine the UTF-16 value of a character.)

PROBLEM:
- UTF-16 string value is sum of all the UTF-16 values for each code in the string
- use String.prototype.charCodeAT() to determine UTF-16 value of a character

EXAMPLES:
utf16Value('Four score');         // 984
utf16Value('Launch School');      // 1251
utf16Value('a');                  // 97
utf16Value('');                   // 0

// The next three lines demonstrate that the code
// works with non-ASCII characters from the UTF-16
// character set.
const OMEGA = "\u03A9";             // UTF-16 character 'Ω' (omega)
utf16Value(OMEGA);                  // 937
utf16Value(OMEGA + OMEGA + OMEGA);  // 2811

DATA STRUCTURES
- could create an array of chars in string

ALGORITHM:
declare sum variable
- iterate through the indices of the string
  - get char at current index from string
  - get UTF-16 code
  - add to sum
- return the UTF16 sum

*/

function utf16Value(string) {
  let sum = 0;
  for (let index = 0; index < string.length; index += 1) {
    sum += string.charCodeAt(index);
  }
  return sum;
}


// Alternative
function utf16Value(string) {
  return Array.from(string).reduce((sum, char) => sum + char.charCodeAt(0), 0);
}

console.log(utf16Value('Four score'));         // 984
console.log(utf16Value('Launch School'));      // 1251
console.log(utf16Value('a'));                  // 97
console.log(utf16Value(''));                   // 0

// The next three lines demonstrate that the code
// works with non-ASCII characters from the UTF-16
// character set.
const OMEGA = "\u03A9";             // UTF-16 character 'Ω' (omega)
console.log(utf16Value(OMEGA));                  // 937
console.log(utf16Value(OMEGA + OMEGA + OMEGA));  // 2811
