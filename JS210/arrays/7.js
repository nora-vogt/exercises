/* 
Array Shift and Unshift

In this exercise, you will implement your own versions of the Array.prototype.shift and Array.prototype.unshift methods. These methods manipulate the contents of an array starting from the first index.

The shift method removes the first element from an array and returns that element; if the array is empty, shift returns undefined. The unshift method adds one or more elements to the start of an array and returns the new length of the array. Both methods mutate the original array.

SHIFT:
- removes and returns the first element of an array, mutating the array
- if array is empty, returns undefined

ALGO:
- set first to first element in array
- iterate through indices of array
  - set element at current index to element at next index
- reassign array length to length - 1
- return first element

OR: reverse array > pop > reverse
- return popped element

UNSHIFT:
- adds one or more elements to start of array, mutating the array
- returns the new length of the array

- reverse array,iterate through args array, push each element to the array
- reverse the array again
  - return length of new array

OR:
- iterate 
*/

// function shift(array) {
//   if (array.length === 0) {
//     return undefined;
//   }

//   let first = array[0];
//   for (let index = 0; index < array.length; index += 1) {
//     array[index] = array[index + 1];
//   }

//   array.length -= 1;
//   return first;
// }

function shift(array) {
  let first = array.reverse().pop();
  array.reverse();
  return first;
}

function unshift(array, ...args) {
  array.reverse();
  for (let index = 0; index < args.length; index += 1) {
    array.push(args[index]);
  }
  array.reverse();
  return array.length;
}

/* LS Solutions 

splice(start, deleteCount) -> mutates the calling array and returns a new array containing the removed segement from the original array. Since that array is 1 element long in this case, we call pop on it to remove and return that element .

*/
function shift(array) {
  let result;

  if (array.length !== 0) {
    result = array.splice(0, 1)
  }

  return result;
}

/* 
splice(start, deleteCount, item1) -> splice(i, 0, args[i]) -> this is going to REPLACE the item at index i without deleting any items, essentially unshifting all items to the right. 
*/

function unshift(array, ...args) {
  for (let i = 0; i < args.length; i += 1) {
    array.splice(i , 0, args[i]);
  }

  return array.length;
}

// Could refactor to
function unshift(arr, ...values) {
  arr.splice(0, 0, ...values);
  return arr.length;
}


// console.log(shift([1, 2, 3]));                // 1
// console.log(shift([]));                       // undefined
// console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]
