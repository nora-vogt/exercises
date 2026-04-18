/* 

Array and String Reverse

In this exercise, you will implement your own version of the Array.prototype.reverse method. Your implementation should differ from the built-in method in the following two ways:

    It should accept either a string or an array as an argument.
    It should return a new string or array.

- check if input is a string
  - if yes, create a new empty string
  - if no, create a new empty array

-  itereate through indices of input from last to 0
  - get element at current index
  - if input is a string
    - concatenate element to reversed
  - otherwise
    - assign to reversed[reversed.length]
*/

function reverseArray(array) {
  let reversed = [];
  let length = array.length;
  for (let index = length - 1; index >= 0; index -= 1) {
    reversed[reversed.length] = array[index];
  }

  return reversed;
}

function reverseString(string) {
  let reversed = '';
  let length = string.length;

  for (let index = length - 1; index >= 0; index -= 1) {
    reversed += string[index];
  }

  return reversed;
}


function reverse(inputForReversal) {
  if (typeof inputForReversal === 'string') {
    return reverseString(inputForReversal);
  } else {
    return reverseArray(inputForReversal);
  }
}

// Refactored
// Just built the reversed array and join it to a string if input is a string:
function reverse(input) {
  let output = [];

  for (let i = input.length - 1; i >= 0; i -= 1) {
    output.push(input[i]);
  }

  return Array.isArray(input) ? output : output.join('');
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]

// Buggy solution: find the bugs
// function reverse(inputForReversal) {
//   if (Array.isArray(inputForReversal)) {
//     return reverseArray(inputForReversal);
//   } else {
//     return reverseString(inputForReversal);
//   }
// }

// function reverseArray(inputForReversal) {
//   const reversed = [];
//   const length = inputForReversal.length; // 

//   for (let i = 0; i < length; i += 1) {
//     reversed[length - i] = inputForReversal[i]; // this adds an extra empty element to the beginning of reversed. need to length - 1 - i
//   }

//   return reversed;
// }

// function reverseString(inputForReversal) {
//   const stringArray = inputForReversal.split(' '); // need to split on an empty string - there isn't whitespace to split on, so we'll get an array containing one string element
//   return reverseArray(stringArray).join(' ');
// }

// console.log(reverse('Hello'));           // "olleH"
// console.log(reverse('a'));               // "a"
// console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
// console.log(reverse([]));                // []

// const array = [1, 2, 3];
// console.log(reverse(array));             // [3, 2, 1]
// console.log(array);                      // [1, 2, 3]

// // LS Actual Solution
// function reverse(inputForReversal) {
//   if (Array.isArray(inputForReversal)) {
//     return reverseArray(inputForReversal);
//   } else {
//     return reverseString(inputForReversal);
//   }
// }

// function reverseArray(inputForReversal) {
//   const reversed = [];
//   const length = inputForReversal.length;

//   for (let i = 0; i < length; i += 1) {
//     reversed[length - 1 - i] = inputForReversal[i];
//   }

//   return reversed;
// }

// function reverseString(inputForReversal) {
//   const stringArray = inputForReversal.split('');
//   return reverseArray(stringArray).join('');
// }
