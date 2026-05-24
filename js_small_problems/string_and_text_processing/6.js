/* 
Staggered Caps Part 1
Write a function that takes a string as an argument and returns that string with a staggered capitalization scheme. Every other character, starting from the first, should be capitalized and should be followed by a lowercase or non-alphabetic character. Non-alphabetic characters should not be changed, but should be counted as characters for determining when to switch between upper and lower case.

- Staggered caps mean:
  - first char, and then every other, of string shoudl be capitalized and then followed by a lowercase or a non-alphabetic character
  - Don't change non-alphabetic chars, but they should be counted as chars for determining when to switch between upper and lower case

Examples
I LoVe lAuNcH ScHoOl!
- space counts as lowercase/other
- uppercase at even indices

AlL_CaPs
- underscore at index 3 counts as lowercase/other

IgNoRe 77 ThE 4444 nUmBeRs

ALGO:
- split chars of string into an array -> transformation
  - if the index is even,
    - if char is a letter, return an uppercase letter
    - otherwise return the char
  - if the index is odd, 
    - if the char is non-alphabetical, return it
    - otherwise, return a lowercased char
*/

function staggeredCase(string) {
  return string.split('').map((char, index) => {
    if (index % 2 === 0) {
      return /[a-z]/i.test(char) ? char.toUpperCase() : char;
    } else {
      return /[a-z]/i.test(char) ? char.toLowerCase() : char;
    }
  }).join('');
}

/* LS Solution - just allows toUpperCase/toLowerCase to handle the non-alphabetic chars: */

function staggeredCase(string) {
  return string
    .split("")
    .map((char, index) => {
      if (index % 2 === 0) {
        return char.toUpperCase();
      } else {
        return char.toLowerCase();
      }
    })
    .join("");
}

console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 4444 nUmBeRs"
