/* Counting the Number of Characters 

In this exercise, you will write a program that asks the user for a phrase, then outputs the number of characters in that phrase. Go over the documentation for String to find an appropriate method to use.
*/

const rlSync = require('readline-sync');

let phrase = rlSync.question('Please enter a phrase: ');
console.log(`There are ${phrase.length} characters in "${phrase}"`);

/* remember the method is String.prototype.length

so phrase.length is equivalent to 

Further Exploration:
Refactor it to ignore spaces

String.prototype.replace(searchFor, replaceWith)
- searchFor can be a regex
- replaces first instance of match

use replaceAll - if with regex, must have global flag
*/

let phraseWithoutSpaces = phrase.replaceAll(/\s/g, '')
let numberOfNonSpaceCharacters = phraseWithoutSpaces.length;
console.log(`There are ${numberOfNonSpaceCharacters} characters in "${phraseWithoutSpaces}"`);


// next refactor so it only counts alphabetic characters
let alphaPhrase = phrase.replaceAll(/[^A-Za-z]/g, '');
let numberOfAlphabeticChars = alphaPhrase.length

console.log(`There are ${numberOfAlphabeticChars} characters in "${alphaPhrase}"`);
