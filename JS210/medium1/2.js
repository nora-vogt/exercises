let i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}

/* 
The following program is expected to log each number between 0 and 9 (inclusive) that is a multiple of 3. Read through the code shown above. Will it produce the expected result? Why or why not?

No, this will not produce the expected result. On the first iteration, `i` will have a value of `0`. `0 % 3 === 0` returns `true`, so the `if` branch of the statemetn will execute, logging the value of `i`. 

The `if` branch does not increment `i`, so an infinite loop will be created, continuing to log `0`.

To fix this, we need to refactor the code so that `i` is incremented on every iteration:
*/

let i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  }

  i += 1;
}
