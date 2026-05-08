const transactionLog = [];

function processInput(input) {
  const numericalData = parseFloat(input);

  if (Number.isNaN(numericalData)) {
    throw (new Error('Data could not be converted to numerical amount.'));
  }

  return numericalData;
}

function logTransaction() {
  let data = prompt('Please enter the transaction amount: ');

  try {
    data = processInput(data);
    transactionLog.push(data);

    alert('Thank you. Data accepted.');
  } catch (error) {
    alert(error);
  }
}

function transactionTotal() {
  let total = 0;

  for (let i = 0; i < transactionLog.length; i++) {
    total += transactionLog[i];
  }

  return total;
}

logTransaction();
logTransaction();
logTransaction();

console.log(transactionTotal());
/* 
Shop Transactions
Todd wrote some simple code in an attempt to log his shop's financial transactions. Each time he makes a sale or spends money on inventory, he logs that deposit or withdrawal via the logTransaction function. His code also intends to ensure that each transaction logged is a valid numerical amount. At the end of each day, he displays his total gain or loss for the day with transactionTotal.

Test out the code yourself. Can you spot the problem and fix it?

This code runs into unexpected behavior in the `try/catch` block within the `logTransaction` function.

The `catch` block does not define a parameter that the error object will be passed to. When the user enters non-numerical data, the `catch` block will execute and `alert(error.message)` will be evaluated. However, `error` has not been defined at this point and will raise a `ReferenceError`.

To fix this, we need to define a parameter for the `catch` block:

  } catch (error) {
    alert(error.message);
  }
*/
