/*
Grocery List

Write a function that takes a grocery list in a two-dimensional array and returns a one-dimensional array. Each element in the grocery list contains a fruit name and a number that represents the desired quantity of that fruit. The output array is such that each fruit name appears the number of times equal to its desired quantity.

In the example below, we want to buy 3 apples, 1 orange, and 2 bananas. Thus, we return an array that contains 3 apples, 1 orange, and 2 bananas.

INPUT: nested array
OUTPUT: 1D array
  - fruit name appears n times, where n is the second element of each nested array

Abstractions:
- transform the array elements into the expanded grocery list
- flatten the array of arrays using a folding strategy
*/

function repeat(fruit) {
  let result = [];

  for (let count = 0; count < fruit[1]; count += 1) {
    result.push(fruit[0]);
  }

  return result;
}

function buyFruit(fruits) {
  return fruits.reduce((result, fruit) => {
    return result.concat(repeat(fruit));
  }, []);
}

// LS Solution
// function buyFruit(fruitsList) {
//   return fruitsList.map(fruit => repeat(fruit))
//                    .reduce((groceryList, fruit) => groceryList.concat(fruit));
// }

// function repeat(fruit) {
//   const result = [];

//   for (let i = 0; i < fruit[1]; i += 1) {
//     result.push(fruit[0]);
//   }

//   return result;
// }

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
