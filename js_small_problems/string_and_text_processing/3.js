/* 
Lettercase Counter
Write a function that takes a string and returns an object containing three properties: one representing the number of characters in the string that are lowercase letters, one representing the number of characters that are uppercase letters, and one representing the number of characters that are neither.
*/

function countLowercase(string) {
  return string.replace(/[^a-z]/g, '').length;
}

function countUppercase(string) {
  return string.replace(/[^A-Z]/g, '').length;
}

function letterCaseCount(string) {
  let lowercase = countLowercase(string);
  let uppercase = countUppercase(string);
  let neither = string.length - uppercase - lowercase;

  return { lowercase, uppercase, neither };
}

/*
LS Solution
  What did they see that I didn't? match will return an array of all matching characters, so an array of uppercase lowercase etc. just get the length of that array.
*/

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }
