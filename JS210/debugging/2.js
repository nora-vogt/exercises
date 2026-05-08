// function includesFalse(list) {
//   for (let i = 0; i < list.length; i++) {
//     let element = list[i];

//     if (element == false) {
//       return true;
//     }
//   }

//   return false;
// }
//                                                                   // returns:
// includesFalse([8, null, 'abc', true, 'launch', 11, false]);       // true
// includesFalse(['programming', undefined, 37, 64, true, 'false']); // false
// includesFalse([9422, 'lambda', true, 0, '54', null]);             // true


/* 
Includes False

Caroline has written a very simple function, includesFalse, that searches a list of primitives for the boolean false. If false is found, the function immediately returns true. If no occurrence of false has been found after iterating through the entire array, the function returns false.

Caroline's last method invocation of includesFalse (line 15) doesn't return what she expects. Why is that? Fix the code so that it behaves as intended.

This code behaves unexpectedly due to line 5: `if (element == false)`.

This condition uses the loose equality operator, which performs implicit type coercion when comparing operands of two different types. 

On line 15: `includesFalse([9422, 'lambda', true, 0, '54', null]` each value in the argument array is compared to `false` using `==`. 

The result of the comparisons are:
9422 == false => 9422 == 0 => false
'lambda' == false => NaN == 0 => false
true == false => 1 == 0 => false
0 == false => 0 == 0 => true

It is the element `0` that causes the `if` condition to evaluate to true, and the `includesFalse` method to return `true`. When comparing a boolean to a number, the boolean will be coerced to a number. In this case, `false` is coerced to `0`, and `0 == 0` returns `true`. 

To fix this code, we should compare the operands using strict equality, which does not perform implicit type coercion. This will check whether the operands are both the boolean `false`:
*/

function includesFalse(list) {
  for (let i = 0; i < list.length; i++) {
    let element = list[i];

    if (element === false) {
      return true;
    }
  }

  return false;
}
                                                                  // returns:
console.log(includesFalse([8, null, 'abc', true, 'launch', 11, false]));       // true
console.log(includesFalse(['programming', undefined, 37, 64, true, 'false'])); // false
console.log(includesFalse([9422, 'lambda', true, 0, '54', null]));             // false
