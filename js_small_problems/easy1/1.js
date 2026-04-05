/* Log all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line. 

ALGORITHM:
- iterate from 1 - 99
  - log the number
  - increment the current number by 2
*/

for (let number = 1; number < 100; number += 2) {
  console.log(number);
}

/* Further Exploration */
// allow user to specify the limits

function logOddNumbers(limit) {
  let currentNumber = 1;
  while (currentNumber <= limit) {
    console.log(currentNumber);
    currentNumber += 2;
  }
}

logOddNumbers(100);
logOddNumbers(15);
