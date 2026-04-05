/* 

How Big is the Room

Build a program that asks the user to enter the length and width of a room in meters, and then logs the area of the room to the console in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the unit at this time. Use the readlineSync.prompt method to collect user unit.

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.00 square meters (753.47 square feet).
*/

// let rlSync = require('readline-sync');

// const SQMETERS_TO_SQFEET = 10.7639;

// console.log('Enter the length of the room in meters: ');
// let length = rlSync.prompt();
// length = parseInt(length, 10);

// console.log('Enter the width of the room in meters: ');
// let width = rlSync.prompt();
// width = parseInt(width, 10);

// let areaSqMeters = length * width;

// let areaSqFeet = areaSqMeters * SQMETERS_TO_SQFEET;

// console.log(`The area of the room is ${areaSqMeters.toFixed(2)} square meters (${areaSqFeet.toFixed(2)} square feet).`);

/* Further Exploration 

Modify the program so that it asks the user for the unit type (meters or feet). Compute for the area accordingly, and log it and its conversion in parentheses.

- ask the user if unit is meters or feet, convert to downcase and assign to variable
- set constants for converting square meters to feet and vice versa
- get length and width from the user
  - convert both to integers

- if the unit is meters
  - calculate square feet
- if the unit is square feet
  - calculate square meters
- construct output string for user
*/

const SQMETERS_TO_SQFEET = 10.7639;
const SQFEET_TO_SQMETERS = 10.7639;
let rlSync = require('readline-sync');

console.log('Is unit in meters or feet?')
let unit = rlSync.prompt();
unit = unit.toLowerCase();

console.log(`Enter the length of the room in ${unit}:`);
let length = rlSync.prompt();
length = parseInt(length, 10);

console.log(`Enter the width of the room in ${unit}:`);
let width = rlSync.prompt();
width = parseInt(width, 10);

let area = length * width;

if (unit === 'feet') {
  convertedArea = area / SQFEET_TO_SQMETERS;
  conversionUnit = 'square meters';
} else if (unit === 'meters') {
  convertedArea = area * SQMETERS_TO_SQFEET;
  conversionUnit = 'square feet';
}

console.log(`The area of the room is ${area.toFixed(2)} square ${unit} (${convertedArea.toFixed(2)} ${conversionUnit}).`);
