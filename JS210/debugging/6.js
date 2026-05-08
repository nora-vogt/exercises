/*Arrays in JavaScript can have both elements and properties. Elements are values assigned to positive-integer (inclusive of 0) index positions. Since arrays are Objects, indices are keys and elements are the associated value. 

When adding a new value to an array and specifying an index that is anything other than 0 or a positive integer, a new property will be created.

We can demonstate this through the `Array.prototype.length` property. `length` will always return a digit that is 1 greater than the largest index. 

Adding new element to an array will increase the `length`, while adding properties will not.
*/


let arr = ['a', 'b', 'c'];
console.log(arr.length); // 3

arr[4] = 'd';
console.log(arr); // [ 'a', 'b', 'c', <1 empty item>, 'd' ] - no element has been assigned at index 3, so it is an empty slot in the array.
console.log(arr.length); // 5

arr[-10] = 'hello';
console.log(arr); //[ 'a', 'b', 'c', <1 empty item>, 'd', '-10': 'hello ]
console.log(arr.length); // still 5
