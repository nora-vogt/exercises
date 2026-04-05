/* 
Short Long Short

Write a function that takes two strings as arguments, determines the length of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

INPUT: two strings
OUTPUT: string, concatenate short + long + short

RULES: 
- strings will be different lengths
- either string may be empty
  - empty strings have a length of 0

EXAMPLES:
shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"

ALGORITHM:
- check if length of string1 is less than string2
  - assign short to string1
  - assign long to string2
- otherwise
  - assign short to string2
  - assign long to string1

concatenate short + long + short and return

- refactor to: just concatenate differently in the conditional
*/

function shortLongShort(string1, string2) {
  if (string1.length < string2.length) {
    return string1 + string2 + string1;
  } else {
    return string2 + string1 + string2;
  }
}

console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
console.log(shortLongShort('', 'xyz'));         // "xyz"
