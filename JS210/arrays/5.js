/* 
Array Pop and Push

In this exercise, you will implement your own version of two Array methods: Array.prototype.pop and Array.prototype.push. The pop method removes the last element from an array and returns that element. If pop is called on an empty array, it returns undefined. The push method, on the other hand, adds one or more elements to the end of an array and returns the new length of the array.

POP:
- if array length is 0, return undefined
- removes last element from the array, mutating the array
- returns that removed element

ALGO:
- set lastElement to the last element in the given array
- reassign array length to array length - 1


PUSH:
- function should accept any number of arguments
  - first arg is array to add elements to 
- add those arguments, in order, to the end of the current array, mutating the array
- if last element is an array, remove/return that whole array
- return the new length of the array

ALGO:
- set length to the length of the first array arg
- iterate through the args array
  - get current element
  - reassign the element at length + index in first array arg
- return that array

*/

function pop(array) {
  if (array.length === 0) {
    return undefined;
  }

  let lastElement = array[array.length - 1]; 

  array.length -= 1;
  return lastElement;
}

function push(array, ...args) {
  let originalLength = array.length;
  for (let index = 0; index < args.length; index += 1) {
    let element = args[index];
    array[originalLength + index] = element;
  }
  return array.length;
}



// pop
// const array1 = [1, 2, 3];
// console.log(pop(array1));                        // 3
// console.log(array1);                // [1, 2]
// console.log(pop([]));                           // undefined
// console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]

// push
const array2 = [1, 2, 3];
console.log(push(array2, 4, 5, 6));              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]

console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0


/* Buggy solution - find the bug: */

function pop(array) {
  const poppedElement = array[array.length]; // array[array.length] will return undefined - this references the index position that is one greater than the last element in the array
  array.splice[array.length]; // this won't actually remove the last element / mutate the array; need to pass array.length - 1;

  return poppedElement; // this function also doesn't handle returning undefined for an empty array
}

function push(array, ...args) {
  const length = args.length;

  for (let i = 1; i < length; i += 1) {
    array[i] = args[i]; 
  }

  return array.length;
}
// this code iterates through the indices of the args array, starting at index 1. on the first iteration, it reassigns array[1] to the value of args[1], and so on. Some values in the original array may be reassigned, rather than adding additional values to the end of the array. 


// Fixed LS solutions:
function pop(array) {
  const poppedElement = array[array.length - 1];
  array.splice(array.length - 1);

  return poppedElement;
}

function push(array, ...args) {
  const length = args.length;

  for (let i = 0; i < length; i += 1) {
    array[array.length] = args[i]; // since we're mutating the array and increasing its length on each iteration, we can just use array.length rather than capturing the original length and using length + i (though that works too)
  }

  return array.length;
}
