/*
Array Slice and Splice

In this exercise, you will implement your own versions of the Array.prototype.slice and Array.prototype.splice methods according to the following specifications.

The slice function takes three arguments: an array, and two integers representing a begin and an end index. The function returns a new array containing the extracted elements starting from begin up to but not including end. slice does not mutate the original array.

SLICE:

    The values of begin and end will always be integers greater than or equal to 0.
    If the value of begin or end is greater than the length of the array, set it to equal the length.

INPUT: array, begin index, end index
OUTPUT: a new array containing elements from original array, starting from begin up to end (exclusive)

- begin and end will always be integers >= 0
- if the value of begin or end is greater than the length of the array, set it equal to the length

ALGO:
- if begin is > length of array, reassign to length of array
- if end is > length of arary, reassign to length of array
- set result to an empty array
- iterate through indices of given array, starting at begin until end - 1
  - add element to the result array
- return the result array


SPLICE:
The splice function changes the contents of an array by deleting existing elements and/or adding new elements. The function takes the following arguments: an array, a start index, a deleteCount, and zero or more elements to be added. The function removes deleteCount number of elements from the array, beginning at the start index. If any optional element arguments are provided, splice inserts them into the array beginning at the start index. The function returns a new array containing the deleted elements, or an empty array ([]) if no elements are deleted. splice mutates the original array.

    The values of start and deleteCount will always be integers greater than or equal to 0.
    If the value of start is greater than the length of the array, set it to equal the length.
    If the value of deleteCount is greater than the number of elements from start up to the end of the array, set deleteCount to the difference between the array's length and start.
    Takes optional arguments for elements to add to the array; denoted by the rest parameter ...args. If no elements to add are provided, splice only removes elements from the array.


INPUT:
  - array
  - start index
  - deleteCount
  - zero or more elements to be added
OUTPUT:
  - new array containing the deleted elements
  - or an empty array if no elements are deleted

RULES:
- remove deleteCount number of elements from the array, beginning at the start index
- if optional elements are provided, insert them into the array beginning at the start index
- mutate the original array
- start and deleteCount will always be ints >= 0
- if start > array.length, set it equal to the length
- if deleteCOunt > number of elements from start to end of the array, set deleteCount to array.length - start
- use rest parameter syntax for the optional args to add to the array
- if no elements to add are provided, splice only removes elements from the array
- if elements are provided, we REPLACING all or a portion of the deleted section
- providing a zero delete count returns an empty array



[1, 2, 3]
delete count = 6
start = 2
deleteCount =  3 (length) - 2 (start) -> 1
- basically, if delete count exceeds remaining # of elements, delete all the remaining elements

EDGE: if deleteCount is zero, and we provide elements to replace, those are inserted BEFORE the element at the existing index
  const arr4 = [1, 2, 3];
  console.log(splice(arr4, 1, 0));                    // []
  console.log(splice(arr4, 1, 0, 'a'));               // []
  console.log(arr4);                                  // [1, "a", 2, 3]


ALGO:
- if start > array.length, set it equal to the array length
- if deleteCount > array.length - start, set it to array.length - start (may be off by 1, should it be if delteCount > array.length - 1 - start?)

- capture portion to remove
  - assign to removed;
- reassign array[start] to ...args

- return removed

  - set removed
  - set argIndex to 0
- iterate through indices starting at start
  - if deleteCount > 0
  - add current element to removed
  - reassign element to args[argIndex]
  - decrement deleteCount
  - increment argsIndex

[1, 2, 3, 4, 5, 6]
start 2 delete 2, insert 'a', 'b', 'c'
[1, 2, 'a', 'b', 'c', 5, 6]
-> returns [3, 4]
*/

function splice(array, start, deleteCount, ...args) {
  start = start > array.length ? array.length : start;
  deleteCount = deleteCount + start > array.length ? array.length - start : deleteCount;
  
  let removed = [];
  for (let index = start; index < start + deleteCount; index += 1) {
    if (deleteCount > 0) {
      removed.push(array[index]);
      deleteCount -= 1;
    }

    
  }
}

// function splice(array, start, deleteCount, ...args) {
//   start = start > array.length ? array.length : start;
//   deleteCount = deleteCount + start > array.length ? array.length - start : deleteCount;
  
//   // console.log(start);
//   // console.log(deleteCount);
//   let removed = array.slice(start, start + deleteCount);
//   array[start] = args.flat();

//   return removed;
// }


// splice([1, 2, 3], 1, 6); // deleteCOunt 2
// splice([1, 2, 3], 2, 6); // deleteCount 1
// splice([1, 2, 3], 4, 2); // start 2, deleteCOunt 1

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
console.log(arr2);                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0));                    // []
console.log(splice(arr4, 1, 0, 'a'));               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
splice(arr5, 0, 0, 'a');               // []
arr5;                                  // ["a", 1, 2, 3]


// function slice(array, begin, end) {
//   let length = array.length;
//   begin = begin > length ? length : begin;
//   end = end > length ? length : end;
//   let result = [];

//   for (let index = begin; index < end; index += 1) {
//     result.push(array[index]);
//   }

//   return result;
// }

// console.log(slice([1, 2, 3], 1, 2));               // [2]
// console.log(slice([1, 2, 3], 2, 0));               // []
// console.log(slice([1, 2, 3], 5, 1));               // []
// console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

// const arr1 = [1, 2, 3];
// console.log(slice(arr1, 1, 3));                     // [2, 3]
// console.log(arr1);                                  // [1, 2, 3]
