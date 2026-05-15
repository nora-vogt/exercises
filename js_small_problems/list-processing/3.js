/* 
Multiply All Pairs

Write a function that takes two array arguments, each containing a list of numbers, and returns a new array containing the products of all combinations of number pairs that exist between the two arrays. The returned array should be sorted in ascending numerical order.

You may assume that neither argument will be an empty array.

INPUT: two arrays - non-empty, may be different lengths
OUTPUT: product of multiplying all combinations of numbers from both arrays
  - can contain duplicates
  - sort in ascending numerical order
*/

function multiplyAllPairs(array1, array2) {
  let products = [];
  array1.forEach((number1) => {
    array2.forEach((number2) => {
      products.push(number1 * number2);
    });
  });

  // return result.sort((a, b) => a - b);
  return products.sort(function (a, b) { // anonymous function expression for practice
    return a - b;
  });
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]
