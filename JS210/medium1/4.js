// Alt iterative structure
/* Iterate through the cols array.
  For each element in the cols array:
C reate an empty array (innerArray).
  Iterate through the numbers array.
  For each element in the numbers array (which is itself an array), push the element whose index is equal to the value of the current cols element onto innerArray.
  Push innerArray onto the result.
*/

function getSelectedColumns(numbers, cols) {
  let result = [];

  for (let colsIdx = 0; colsIdx < cols.length; colsIdx += 1) {
    let columnNumber = cols[colsIdx];
    let innerArray = [];
    for (let numsIdx = 0; numsIdx < numbers.length; numsIdx += 1) {
      innerArray.push(numbers[numsIdx][columnNumber]);
    }
    result.push(innerArray);
  }

  return result;
}



// function getSelectedColumns(numbers, cols) {
//   var result = [];

//   for (let i = 0, length = numbers.length; i < length; i += 1) {
//     for (let j = 0, length = cols.length; j < length; j += 1) {
//       if (!result[j]) {
//         result[j] = [];
//       }

//       result[j][i] = numbers[i][cols[j]];
//     }
//   }

//   return result;
// }

// given the following arrays of number arrays
const array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
const array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// `array1` in row/column format
// [[1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]]

console.log(getSelectedColumns(array1, [0]));     // [[1]];            expected: [[1, 4, 7]]
console.log(getSelectedColumns(array1, [0, 2]));  // [[1, 4], [3, 6]]; expected: [[1, 4, 7], [3, 6, 9]]
console.log(getSelectedColumns(array2, [1, 2]));  // [[2, 2], [3, 3]]; expected: [[2, 2, 2], [3, 3, 3]]

/* 
Selected Columns
The getSelectedColumns function selects and extracts specific columns to a new array. Currently, the function is not producing the expected result. Go over the function and the sample runs shown above. What do you think the problem is?

The inner `for` loop does not iterate through each element in the subarrays, because `length` is reassigned in the inner loop. This happens because both the `i`, `j`, and `length` variables are declared using the `var` keyword. Variabels declared with `var` have function scope, so the inner `length` is simply reassigning the same variable declared in the ouer `for` loop.

To fix this, we can change the variable declaration to use the `let` keyword. Variables declared with `let` have block scope, so each `length` will be unique to its block.

*/
