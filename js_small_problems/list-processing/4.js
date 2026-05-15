/* 
Sum of Sums

Write a function that takes an array of numbers and returns the sum of the sums of each leading subsequence in that array. Examine the examples to see what we mean. You may assume that the array always contains at least one number.

- Leading sequence means:
  - create a sum array, set to first element
  - iterate through remaining digits in array
    - push digit to sum array
    - sum that array
    - increment sum by that amount
*/

// function sumOfSums(array) {
//   let sum = array[0];
//   let sumArr = array.slice(0, 1);
//   array.slice(1).forEach(number => {
//     sumArr.push(number);
//     sum += sumArr.reduce((sum, number) => sum + number);
//   });

//   return sum;
// }

// using reduce
function sumOfSums(array) {
  return array.reduce((sum, number, index) => {
    return sum + array.slice(0, index + 1)
                      .reduce((sum, number) => sum + number);
  }, 0);
}

// LS Solution
function sumOfSums(numbers) {
  return numbers.map((number, idx) => numbers.slice(0, idx + 1)
                                             .reduce((sum, value) => sum + value))
                                             .reduce((sum, value) => sum + value);
}


console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
