/* Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip, and then log both the tip and the total amount of the bill to the console. You can ignore input validation and assume that the user will put in numbers.


Example:
What is the bill? 200
What is the tip percentage? 15

The tip is $30.00
The total is $230.00

- Get the bill total from the user
  - convert to number
- Get the tip percentage of the user
  - convert to number
- Convert the tip percentage to a decimal: divide by 100
- Calculate the tip in dollars: bill total times decimal tip
- Log the results
*/

let bill = prompt('What is the bill? ');
bill = parseFloat(bill);
let tipPercent = prompt('What is the tip percentage? ');
tipPercent = parseFloat(tipPercent);

let tipDecimal = parseInt(tipPercent, 10) / 100;
let tipDollars= bill * tipDecimal;
let billTotal = bill + tipDollars;

console.log(`The tip is \$${tipDollars.toFixed(2)}.`)
console.log(`The total is \$${billTotal.toFixed(2)}.`)
