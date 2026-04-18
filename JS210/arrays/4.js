/* 
Array Concat Part 2

The concat function from the previous exercise could only concatenate a maximum of two arrays. For this exercise, you are going to extend that functionality. Refactor the concat function to allow for the concatenation of two or more arrays or values.

- iterate through the arguments
  - if the current element is an array, iterate through all elements and push each to result array
  - otherwise push the elemtn to result array
*/

function concat(...args) {
  let result = [];

  for (let argIndex = 0; argIndex < args.length; argIndex += 1) {
    let element = args[argIndex];
    if (Array.isArray(element)) {
      for (let subIndex = 0; subIndex < element.length; subIndex += 1) {
        result.push(element[subIndex]);
      }
    } else {
      result.push(element);
    }
  }

  return result;
}

function concat2(...args){
  return args.flat();
}

// If you want to flatten all argument arrays, no matter how nested they ar:
function concat3(...args){
  return [args].flat(Infinity);
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]

// Alt student solution
