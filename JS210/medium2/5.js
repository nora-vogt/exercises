const array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges'; // ['Apples', 'Peaches', 'Grapes', '3.4': 'Oranges']
console.log(array.length); // 3
console.log(Object.keys(array).length); // 4

array[-2] = 'Watermelon'; // ['Apples', 'Peaches', 'Grapes', '3.4': 'Oranges', '-2': 'Watermelon']
console.log(array.length); // 3
console.log(Object.keys(array).length); // 5

/* 
What's my value?
What will the following program log to the console? Can you explain why?

`array[3.4] = 'Oranges' adds a new property to `array` with a key of `'3.4'` and a value of `'Oranges`'. Only elements with positive integer keys are counted by the `Array.prototype.length` property. `length` returns 1 greater than the largest element index, and there are only 3 elements in the array with indices `0`, `1`, and `2`, so `3` is logged.

The `Object.keys` method, however, will return an array of all keys in the array, which includes element indices and any property keys. `Object.keys(array).length` will log `4`, since the `'3.4'` key is included in the array returned by `Object.keys(array)`.

`array[-2] = 'Watermelon'` adds another property to `array`, but again, the `length` is not affected because no new element has been added. `console.log(array.length)` still logs `3`, and when checking the length of `Object.keys(array)`, this will now log `5` to reflect the new `'-2'` property.
*/
