/* 
Invoice
The invoiceTotal function in the code below computes the total amount for an invoice containing four "line items". How can you refactor the function so that it will work with invoices containing any number of line items?

To refactor this funciton to work with any number of line items, we can use rest parameter syntax to define a parameter like `...items`. This will allow us to pass any number of arguments, which will be populated as elements in the `items` array within the function body.

Then, instead of summing each individual item, we can use a method like Array.prototype.reduce to sum all items, passing a starting value of 0 to the accumulator, in case the array is empty.
*/


// original
// function invoiceTotal(amount1, amount2, amount3, amount4) {
//   return amount1 + amount2 + amount3 + amount4;
// }

//refactored
function invoiceTotal(...items) {
  return items.reduce((total, number) => total + number, 0);
}


console.log(invoiceTotal(20, 30, 40, 50));          // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40));  // does not work; how can you make it work?
