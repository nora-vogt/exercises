const species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
const isMidnight = true;
const isFullmoon = true;

function isTransformable(species) {
  return species[0] === 'w';
}

function transform(species) {
  return `were${species}`;
}

for (let index = 0; index < species.length; index++) {
  const thisSpecies = species[index];
  var newSpecies;

  if (isMidnight && isFullmoon && isTransformable(thisSpecies)) {
    newSpecies = transform(thisSpecies);
  }

  if (newSpecies) {
    console.log(`Beware of the ${newSpecies}!`);
  }
}

/* Run the following code. Why is every warning displayed twice? Change the code so that each warning is displayed only once, as intended.

This code displays each warning twice due to the declaration of `newSpecies` with `var`. Variables declared with `var` have function scope, not block scope. During the creation phase, JavaScript hoists this variable declaration to the top of its containing function, which is the global scope of the file in this case. So, `newSpecies` is only declared once, and it is not re-declared or reset on each iteration of the `for` loop.

On the first iteration, `wolf` is a species that can transform, so `newSpecies` is assigned to the return value of `transform(thisSpecies)`, `werewolf`, and the warning will be logged.

`newSpecies` will continue to have a value of `werewolf` until the next iteration when a species transform and `newSpecies` will be reassigned, which is why we are seeing the warning printed out when `species` has a value of `human`, and so on. 

To fix this, we can change `var newSpecies` on line 15 to a declaration with `let` instead: `let newSpecies`.

Variables declared with `let` are scoped locally to the block, so a new variable called `newSpecies` will be declared upon each iteration of the `for` loop. This allows `newSpecies` to have a value of `undefined` on the iterations where no transformation takes places, avoiding erroneously printing a warning on those iterations.

*/
