/*
Staggered Caps Part 2
Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

RULES:
- first letter is always uppercase
  - subsequent alphabetic chars should alternate case
- ignore non-alpha chars

- create a lastUppercase flag, set to false

- split string into an array
- iterate through the array -> transformation
  - check if current char is a letter
    - if yes, check if lastUppercase flag is true
      - if yes, return lowerchaed char and set lastCharUppercase to false
      - if no, return uppercased char and set lastCharUppercase to true
  - otherwise return the current char
*/

function staggeredCase(string) {
  let lastCharUppercase = false;

  return string.split('').map(char => {
    if (/[a-z]/i.test(char)) {
      let newChar = '';
      if (lastCharUppercase) {
        newChar = char.toLowerCase();
      } else {
        newChar = char.toUpperCase();
      }
      lastCharUppercase = !lastCharUppercase;
      return newChar;
    } else {
      return char;
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"
