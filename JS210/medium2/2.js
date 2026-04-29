const person = { name: 'Victor' };
const otherPerson = { name: 'Victor' };

console.log(person === otherPerson);    // false -- expected: true

/* 
Equal
Read through the following code. Currently, it does not log the expected result. Explain why this happens, then refactor the code so that it works as expected.

This code logs `false` because the strict equality operator, when used with objects, checks if both operands are the same object. In this case, `person` and `otherPerson` represent two distinct objects in memory, so this comparison returns `false`.

To fix this, we can assign `otherPerson` to the same object that `person` references:

*/
const person = { name: 'Victor' };
const otherPerson = person;

console.log(person === otherPerson);    // true
