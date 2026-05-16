/* 
All Substrings

Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins. This means that all substrings that start at index position 0 should come first, then all substrings that start at index position 1, and so on. Since multiple substrings will occur at each position, return the substrings at a given index from shortest to longest.

You may (and should) use the leadingSubstrings function you wrote in the previous exercise:

iterate through each character of the string
  - call leadingSubstrings, passing in a slice starting at current idx - end of string
*/
function leadingSubstrings(string) {
  return [...string].map((letter, index) => string.slice(0, index + 1));
}

function substrings(string) {
  let substrings = [];
  for (let startIndex = 0; startIndex < string.length; startIndex += 1) {
    let substring = string.substring(startIndex);
    substrings = substrings.concat(leadingSubstrings(substring));
  }

  return substrings;
}

/* 
Further Exploration

Rewrite substrings using list processing functions. That is, convert the string into an array of some sort and use functions like map, filter, or reduce to get the desired substrings. (You will also need to use join.) Try not to use forEach as that is too similar to the for loop approach.
*/

// using flatMap
function substrings(string) {
  return string.split('').flatMap((_, index) => {
    let substring = string.slice(index);
    return leadingSubstrings(substring);
  });
}

// using reduce
function substrings(string) {
  return string.split('').reduce((arr, _, index) => {
    let substring = string.slice(index);
    return arr.concat(leadingSubstrings(substring));
  }, []);
}

console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]
