/* 
Sum of Digits
Write a function that takes one argument, a positive integer, and returns the sum of its digits. Do this without using for, while, or do...while loops - instead, use a series of method calls to perform the sum.

INPUT: positive integer
OUTPUT: sum of all digits in positive integer

RULES:
- don't use: for, while, or do...while loops
- do use: a series of method calls to perform the sum

DATA STRUCTURES:
- String() -> string of digits
  - Split -> array of string digits
    - Map -> array of numbers
      -> Reduce -> sum of numbers

Make it even shorter by cutting out the map! Just transform in reduce:
*/

function sum(number) {
  return String(number)
    .split('')
    .reduce((sum, digit) => sum + Number(digit), 0);
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45
