const languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages);
console.log(languages.length);

languages.length = 4;
console.log(languages);
console.log(languages.length);

languages.length = 1;
console.log(languages);
console.log(languages.length);

languages.length = 3;
console.log(languages);
console.log(languages.length);

languages.length = 1;
languages[2] = 'Python';
console.log(languages);
console.log(languages[1]);
console.log(languages.length);

/* 
Length
Read through the code below. What values will be logged to the console? Can you explain these results?

On line 2, `console.log(languages);` logs the value of the `languages` array: `[ 'Javascript', 'Ruby', 'Python' ]`.

Line 3 will log the length of the languages array, which is `3`. There are three elements with the indices `0`, `1`, and `2` in the array, and the `length` property is always one greater than the largest element index. 

Line 5 assigns the `languages` array length to `4`. 
When we log the value of `languages`, we now see that there is one empty element in the array: `[ 'JavaScript', 'Ruby', 'Python', <1 empty item> ]`. This happens because the `length` property was assigned to a value greater than the number of current elements in the array, so avaScript extends the array up to index 3, creating an empty slot at that index.

Line 6 logs the new `length` of the array, which is `4`. Even though the element at index `3` has no value, that index still exists in the array, making the length `4`.

On line 9, `languages.length = 1`, the `length` property is reassigned to `1`. This removes all but the first element in the array, so languages has a value of `[ 'Javascript' ]`. That value is output by line 10, `[ 'Javascript' ]`, and the `length` of `1` is output by line 12. 

On line 13, `languages.length = 3` reassigns the `length` property to `3`. This adds two empty elements to the array, making the value `[ 'Javascript', <2 empty items> ]`. 
When `languages` is logged by line 14, the value of `[ 'Javascript', <2 empty items> ]` is logged, and the length of `3` is loged by line 15.

Then, `languages[2] = 'Python'` reassigns the empty element at index `2`. This results in `languages` having an empty value at just index `1` in the array: `[ 'Javascript', <1 empty item>, 'Python' ]`.

When the value of `languages[1]` is logged by line 20, `undefined` will be logged. The element at that index does not have a value of `undefined`, the slot is empty. Rather, when ou try to access a missing array element, JavaScript returns `undefined`.

Finally, line 21 logs the `length` of the languages array, which is `3`. There are three indices: `0`, `1`, and `2`, so `length` is `3`.

*/
