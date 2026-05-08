// function placeABet(guess) {
//   (function generateRandomInt() {
//     return Math.floor(Math.random() * 25) + 1;
//   });

//   const winningNumber = generateRandomInt();

//   if (guess < 1 || guess > 25) {
//     return 'Invalid guess. Valid guesses are between 1 and 25.';
//   }

//   if (guess === winningNumber) {
//     return "Congratulations, you win!";
//   } else {
//     return "Wrong-o! You lose.";
//   }
// }

// const userGuess = parseInt(prompt('Input a guess between 1-25'), 10);
// alert(placeABet(userGuess));

/*
Place A Bet

The function placeABet below accepts a guess from the user between 1 and 25. The function should determine a winning number and return a message to the user indicating whether he/she entered a winning guess. When you try to invoke placeABet, an error is raised. Fix the bug and explain what caused it.

This code will raise an error that `generateRandomInt` has not been defined.

The definition of this function on line 2 is wrapped in parentheses, which makes this a function expression, rather than a function declaration. Function expressions must be explicitly assigned to a variable in order to be called. Currently, that function is inaccessible on line 6 when the code attempts to call it. 

To fix that, we can modify the code to assign this function expression to a variable, while removing the parentheses, which are unnecessary. That will allow us to invoke the function on line 6. We could also simply remove the parentheses, which would make this a function declaration.
*/

function placeABet(guess) {
  const generateRandomInt = function() {
    return Math.floor(Math.random() * 25) + 1;
  };

  const winningNumber = generateRandomInt();

  if (guess < 1 || guess > 25) {
    return 'Invalid guess. Valid guesses are between 1 and 25.';
  }

  if (guess === winningNumber) {
    return "Congratulations, you win!";
  } else {
    return "Wrong-o! You lose.";
  }
}

const userGuess = parseInt(prompt('Input a guess between 1-25'), 10);
alert(placeABet(userGuess));
