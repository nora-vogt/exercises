function productOfSums(array1, array2) {
  let result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  let sum;

  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum;
}

let arr1 = [1, 2, 3, 3, 4];
let arr2 = [5, 5, 6, 7, 8, 0];

console.log(productOfSums(arr1, arr2));

/*
Product of Sums
The productOfSums function shown below is expected to return the product of the sums of two arrays of numbers. Read through the following code. Will it produce the expected result? Why or why not?

No, this code will not produce the expected result. The `total` function does not have an explicit `return` statement, and so it will return `undefined` instead of `sum`.

When `productOfSums` is invoked, `total(array1) * total(array2)` will be executed with `undefined * undefined` as the values, which will return NaN.
*/
