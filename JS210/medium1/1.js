/* 
Logical Operation
What will each line of the following code return? Don't run the code until after you have tried to answer.
*/

console.log((false && undefined)); // false
console.log((false || undefined)); // undefined
console.log((false && undefined) || (false || undefined));
  // false || undefined => undefined
console.log(((false || undefined) || (false && undefined)));
  // undefined || false => false
console.log(((false && undefined) && (false || undefined)));
  // false && undefined => false
console.log(((false || undefined) && (false && undefined)));
  // undefined && false => undefined
console.log(('a' || (false && undefined) || ''));
  // 'a' || false || '' => 'a' || '' => 'a'
console.log(((false && undefined) || 'a' || ''));
  // false || 'a' || '' => 'a' || '' => 'a'
console.log(('a' && (false || undefined) && ''));
  // 'a' && undefined && '' => undefined && '' => undefined
console.log(((false || undefined) && 'a' && ''));
  // undefined && 'a' && '' => undefined && '' => undefined
