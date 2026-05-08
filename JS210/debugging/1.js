function randomGreeting() {
  const words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
               'Greetings', 'Salutations', 'Good to see you'];

  const idx = Math.floor(Math.random() * words.length);

  words[idx];
}

function greet(...args) {
  const names = Array.prototype.slice.call(args);

  for (let i = 0; i < names.length; i++) {
    const name = names[i];
    const greeting = randomGreeting;

    console.log(`${greeting}, ${name}!`);
  }
}

greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');

/* 
Hello Friends!

You have written basic functions to display a random greeting to any number of friends upon each invocation of greet. Upon invoking the greet function, however, the output is not as expected. Figure out why not and fix the code.

The output is not as expected due to line 15: `const greeting = randomGreeting`. This line assigns `greeting` to the function object referenced by `randomGreeting`, rather than invoking the `randomGreeting` function. So the output includes the function definition of `randomGreeting` along with the name.

To fix this, we need to add parentheses to `randomGreeting` on line 15 to actually invoke the function:

const greeting = randomGreeting();

Next, the randomGreeting function doesn't have an explicit return statement, so its return value is `undefined`. `undefined` is included in the output as the value of `greeting` to fix this, we need to change line 7 to `return words[idx]`;
*/
