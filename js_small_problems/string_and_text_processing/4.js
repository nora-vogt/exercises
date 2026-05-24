/* 
Capitalize Words

Write a function that takes a string as an argument and returns that string with the first character of every word capitalized and all subsequent characters in lowercase.

You may assume that a word is any sequence of non-whitespace characters.

ALGO:
- split the string into an array of words
- iterate through the array - transformation
  - capitalize the word
- join the new array back into a string
*/

function wordCap(words) {
  return words.split(' ')
              .map(word => word.slice(0, 1).toUpperCase() + word.slice(1).toLowerCase())
              .join(' ');
}

// Fun student solution with regex
function wordCap(string) {
  return string.toLowerCase().replace(/\b\w/g, char => char.toUpperCase() );
}


console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'
