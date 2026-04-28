function padLeft(number) {
  const stringNumber = String(number);
  switch (stringNumber.length) {
    case 1:  return `  ${stringNumber}`;
    case 2:  return ` ${stringNumber}`;
    default: return stringNumber;
  }
}

for (let i = 1; i <= 10; i += 1) {
  let row = '';
  for (let j = 1; j <= 10; j += 1) {
    row += `${padLeft(i * j)} `;
  }

  console.log(row);
}

/* 
Multiplication Table
The above program is expected to log a multiplication table for the numbers from 1 to 10, inclusive, to the console. Read through the code shown below. Will it produce the expected result? Why or why not?

No, this code will not log the multiplication results for the number 10. It only calculates the results for numbers 1-9, because the outer `for` loop will stop iterating when `i` has a value of `10` due to the break condition being set to `i < 10`. 

To fix that, we can change the condition to `i <= 10`.
*/
