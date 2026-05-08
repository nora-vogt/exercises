// function wantToVisit(museum, city) {
//   return museum.includes('Computer')
//       || museum.includes('Science')
//       && !(
//         museum.includes('Modern')
//         && museum.includes('Art')
//         && museum.includes('Andy Warhol')
//         || city === 'Amsterdam'
//       );
// }

// // Tests (should all print 'true')

// console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
// console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
// console.log(wantToVisit('Museum of Modern Art', 'New York') === false); 
// console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false); 
// console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true); // false
// console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
// console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true); // false
// console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true); // false
// console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
// console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);

/* 
Picky Museum Filter
We love to visit museums if they are about science or computers. We're undecided when it comes to modern art, and would rather not go in most cases. However, we're willing to go to any modern art museum that is about Andy Warhol (we like him!) or that is located in nearby Amsterdam. We'd rather skip any other museums.

We tried to implement these preferences in a function, so we can automatically sort through long lists of museums and find the ones that sound interesting. However, our Boolean check is flawed, as it fails some of our test cases. Can you fix it?

The second operand for the `&&` on line 4 is flawed. The code `!(
museum.includes('Modern') && museum.includes('Art') && museum.includes('Andy Warhol') || city === 'Amsterdam'

true && museum.includes('Andy Warhol') || city === 'Amsterdam'
true && 
      )`

Will return true if the museum name does NOT include Modern, Art, Andy Warhol, or the city is NOT Amsterdam. Modern/Art muesuems about Andy Warhol and/or that are located in Amersterdam should not be filtered out.

To fix this, we need a comparison that reads like:
- if the museum includes 'Computer'
- OR the museum includes 'Science'
- OR the museum includes 'Modern' AND 'ART' AND 
  - the museum includes 'Andy Warhol' OR is in 'Amsterdam'

*/

function wantToVisit(museum, city) {
  return museum.includes('Computer')
      || museum.includes('Science')
      || (museum.includes('Modern') 
          && museum.includes('Art') 
          && (museum.includes('Andy Warhol') 
            || city === 'Amsterdam'));
}

// Tests (should all print 'true')

console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
console.log(wantToVisit('Museum of Modern Art', 'New York') === false); 
console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false); 
console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true); 
console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true);
console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);
console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);
