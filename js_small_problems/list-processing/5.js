/* 
Leading Substrings

Write a function that takes a string argument and returns a list of substrings of that string. Each substring should begin with the first letter of the word, and the list should be ordered from shortest to longest.

INPUT: string
OUTPUT: array of substrings
  - each substring should begin with first letter of the word
  - order list from longest to shortest

- basically, get all substrings building progressively from teh start of the string

- create an empty result array
- set index to 0
  - create slice of string from 0 to index + 1
  - push substring to result
  - increment index

*/

// function leadingSubstrings(string) {
//   let substrings = [];
//   let index = 0;
//   while (index < string.length) {
//     substrings.push(string.slice(0, index + 1));
//     index += 1;
//   }

//   return substrings;
// }

// Alt
// function leadingSubstrings(string) {
//   let substrings = [];
//   for (let length = 1; length <= string.length; length += 1) {
//     substrings.push(string.slice(0, length));
//   }
//   return substrings;
// }

// With reduce
// function leadingSubstrings(string) {
//   return [...string].reduce((substrings, letter, index, array) => {
//     // substrings.push(string.slice(0, index + 1));
//     substrings.push(array.slice(0, index + 1).join('')); // can do this way also
//     return substrings;
//   }, []);
// }

// With map
function leadingSubstrings(string) {
  return [...string].map((letter, index) => string.slice(0, index + 1));
}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
