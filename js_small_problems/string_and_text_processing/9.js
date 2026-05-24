/*
Search Word Part 1
Write a function that takes two arguments, a word and a string of text, and returns an integer representing the number of times the word appears in the text.

You may assume that the word and text inputs will always be provided, and that all word breaks are spaces. Thus, some words will include punctuation such as periods and commas.

INPUT, 2 strings (word and text)
OUTPUT: integer - # of times the word appears in text

RULES:
- word and text will always be provided
- all words are separated by spaces
- Some words will include punctuation such as periods and commas
- don't match partial words, i.e. : word: sed text: sediment - don't match sediment

QUESTIONS:
- is word match case sensitive? - YES

ALGO:
- create a new RegExp using the value of the word arg as the pattern, with global and case-insensitive flags
- create an array of matches for that pattern, get the length of that pattern
- match returns null if no matches, so use the ? before the method chain

Further Exploration:
- match only whole words, not partial words
- handle cases in which one or both arguments are missing
*/

// function searchWord(word, text) {
//   let regex = new RegExp(word, 'gi');
//   return text.match(regex)?.length || 0;
// }

// more readable / Further Exploration
// or could set default value of both args to empty string, which will return 0 with no guard clause needed
function searchWord(word, text) {
  if (!word || !text) {
    return 0;
  }
  const regex = new RegExp(`\\b${word}\\b`, 'gi');
  let matches = text.match(regex);

  return matches ? matches.length : 0;
}


const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

console.log(searchWord('sed', text));      // 3
console.log(searchWord('hello', text)); // 0
console.log(searchWord('qui', text));      // should return 4, NOT 13
console.log(searchWord('', text)); // 0
console.log(searchWord('qui')); // 0
console.log(searchWord('', ''));// 0
