/* 
Palindromic Substrings

Write a function that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as backwards. The substrings in the returned list should be sorted by their order of appearance in the input string. Duplicate substrings should be included multiple times.

You may (and should) use the substrings function you wrote in the previous exercise.

For the purpose of this exercise, you should consider all characters and pay attention to case; that is, 'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not. In addition, assume that single characters are not palindromes.

RULES:
- A palindrome contains the same sequence of chars forwards/backwards
- Substrings in returned list should be sorted by their order of appearnce in the input string
- Include duplicate substrings
- Use the substrings function from the previous exercise
- Case sensitive
- single chars are not a palindrome

INPUT: string
OUTPUT array of palindromic substrings

ALGO:
- get all substrings
- check if each substring is a palindrome
  - if yes, select that substring


# isPalindrome - string input
- return false if string is 1 char long
- split string into array of chars, reverse it, join it
- check if string and reverse string have the same value

*/
function leadingSubstrings(string) {
  return [...string].map((letter, index) => string.slice(0, index + 1));
}

function isPalindrome(string) {
  if (string.length <= 1) {
    return false;
  }
  let reversedString = string.split('').reverse().join('');

  return string === reversedString;
}

function substrings(string) {
  let substrings = [];
  for (let startIndex = 0; startIndex < string.length; startIndex += 1) {
    let substring = string.substring(startIndex);
    substrings = substrings.concat(leadingSubstrings(substring));
  }

  return substrings;
}

function palindromes(string) {
  return substrings(string).filter(isPalindrome);
}

// console.log(isPalindrome('Abc-bA') === false);
// console.log(isPalindrome('AbcbA') === true);
// console.log(isPalindrome('Abcba') === false);
// console.log(isPalindrome('a') === false);


console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]


console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada", "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
//[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
