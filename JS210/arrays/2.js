/* Array Copy Part 2: 
In the previous exercise, the value of the reference gets copied. For this exercise, only the values of the array should be copied, but not the reference. Implement two alternative ways of doing this. */

let myArray = [1, 2, 3, 4];
// Option 1: Create a shallow copy with slice
//const myOtherArray = myArray.slice();

// Option 2: Return a new array with filter, selecting all elements
const myOtherArray = myArray.filter( element => element );

// Option 3: iterate and create a new array
// const myOtherArray = [];
// for (let i = 0; i < array.length; i += 1) {
//   myOtherArray.push(myArray[i]);
// }

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);
