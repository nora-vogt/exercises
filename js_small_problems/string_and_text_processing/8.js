/* 
How Long Are You
Write a function that takes a string as an argument and returns an array that contains every word from the string, with each word followed by a space and the word's length. If the argument is an empty string or if no argument is passed, the function should return an empty array.

You may assume that every pair of words in the string will be separated by a single space.

INPUT: string
OUTPUT: array containing transformed strings

RULES:
- each string in returend array should contain:
  - the original word, followed by space, followed by the word's length
- if the arg is an empty string, return an empty array
- if no argument is passed, return an empty array

- if empty string or no argument (undefined), return an empty array
- break string into an array of words on whitespace
- itearate through array -> transformation
  - get length of current string
  - construct new string: current string + ' ' + length, return it
- return transformed array
*/

// since undefined may be passed as an argument, do an explicit arguments check instead
function wordLengths(string) {
  if (string === '' || arguments.length === 0) {
    return [];
  }

  return string.split(' ').map(word => {
    return `${word} ${String(word.length)}`;
  });
}

console.log(wordLengths('cow sheep chicken'));
// ["cow 3", "sheep 5", "chicken 7"]

console.log(wordLengths('baseball hot dogs and apple pie'));
// ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

console.log(wordLengths("It ain't easy, is it?"));
// ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

console.log(wordLengths('Supercalifragilisticexpialidocious'));
// ["Supercalifragilisticexpialidocious 34"]

console.log(wordLengths(''));      // []
console.log(wordLengths());        // []
