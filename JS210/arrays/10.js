/* 
Array Comparison

The array comparison function that we implemented in the Arrays lesson (Alternate link if the previous link doesn't work) implicitly assumed that when comparing two arrays, any matching values must also have matching index positions. The objective of this exercise is to reimplement the function so that two arrays containing the same values—but in a different order—are considered equal. For example, [1, 2, 3] === [3, 2, 1] should return true.

Original: 
function arraysEqual(left, right) {
  if (left.length !== right.length) {
    return false;
  }

  for (let index = 0; index < left.length; index += 1) {
    if (left[index] !== right[index]) {
      return false;
    }
  }

  return true;
}

ALGO:
- sort both arrays before checking if the arrays are equal using the original function

OR:
- check if both arrays have the same length, return false if not
- iterate through array1
  - check if value exists in array2
    - if not, return false

- otherwise, return true

BRAINSTORM: this doesn't work for arrays that include multiple of the same number

ALT:
- create array of unique elements from array 1
- iterate through unique array
  - get count of current element in array1
  - get count of current element in array2
  - if counts are not equal, return false
- return true
*/

function unique(array) {
  let result = [];
  for (value of array) {
    if (!result.includes(value)) {
      result.push(value);
    }
  }

  return result;
}

// function count(array, value) {
//   let count = 0;
//   for (let index = 0; index < array.length; index += 1) {
//     if (array[index] === value) {
//       count += 1;
//     }
//   }

//   return count;
// }

// More elegant count
function count(array, element) {
  return array.filter(x => x === element).length;
}

function areArraysEqual(array1, array2) {
  if (array1.length !== array2.length) {
    return false;
  }

  let uniqueArr1 = unique(array1);
  for (let index = 0; index < uniqueArr1.length; index += 1) {
    let element = uniqueArr1[index];
    if (count(array1, element) !== count(array2, element)) {
      return false;
    }
  }

  return true;
}

// console.log(unique([1, 2, 2, 3, 4, 4, 5]));
// console.log(unique([7, 8]));
// console.log(unique([]));

/* LS Solution 
- return false if lengths aren't equal
- create a copy of array2 with slice
- iterate through indices of array1
  - get element at current index in array1
  - check the index of that element in array2 copy - aka, does it exist in array2?
    - will return an index or -1 if not found
  - if the element exists in array2 (returns index 0 or greater)
    - remove that element from the copy array: array2Copy.splice(index, 1) (start, deleteCount)
  - otherwise the element does not exist in array2Copy, so return false
- return true

*/
function areArraysEqual(array1, array2) {
  if (array1.length !== array2.length) {
    return false;
  }

  let array2Copy = array2.slice();
  for (let i = 0; i < array.length; i += 1) {
    let index = array2Copy.indexOf(array1[i]);
    if (index >= 0) {
      array2Copy.splice(index, 1);
    } else {
      return false;
    }
  }
  return true;
}


console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true
console.log(areArraysEqual([1, '1'], ['1', 1]));                    // true
