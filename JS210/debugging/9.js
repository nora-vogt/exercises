// The shopping cart is a list of items, where each item
// is an object { name: <string>, amount: <number> }.
let shoppingCart = [];

// Currently available products with prices.
const prices = {
  'notebook': 9.99,
  'pencil': 1.70,
  'coffee': 3.00,
  'smoothie': 2.10,
};

function price({name}) { 
  return prices[name];
}

// Adding an item to the shopping cart.
// The amount is optional and defaults to 1.
// If the item is already in the cart, its amount is updated.
function updateCart(name, amount) {
  // amount = amount || 1;
  amount = amount === undefined ? 1 : amount;

  let alreadyInCart = false;

  for (let i = 0; i < shoppingCart.length; i += 1) {
    let item = shoppingCart[i];

    if (item.name === name) {
      item.amount = amount;
      alreadyInCart = true;
      break;
    }
  }

  if (!alreadyInCart) {
    shoppingCart.push({ name, amount });
  }
}

// Calculating the price for the whole shopping cart.
function total() {
  let total = 0;

  for (let i = 0; i < shoppingCart.length; i += 1) {
    let item = shoppingCart[i];

    total += (item.amount * price(item));
  }

  return total.toFixed(2);
}

function pay() {
  // omitted

  console.log(`You have been charged $${total()}.`);
}

function checkout() {
  pay();
  shoppingCart = [];
}

// Example purchase.

updateCart('notebook'); //9.99 
// console.log(checkout());
updateCart('pencil', 2); // 13.39
updateCart('coffee', 1); // 16.39

// Oh wait, I don't need pencils
updateCart('pencil', 0);

checkout();
// You have been charged $14.69.

/* 

We make a few purchases to prepare for our study session, but the amount charged upon checkout seems too high. Run the following code and find out why we are charged incorrectly.

The condition `amount = amount || 1;` in `updateCart` is responsible for the incorrect charge. The intention of this code is: if an amount is not supplied, default to adding 1 item to the cart. 

However, line 72 invokes `updateCart` with an amount of `0` passed in. `0` is falsy in JavaScript, so instead of updating the cart to remove both pencil charges, we update the cart to include the price of one pencil, rather than two. 

To fix this, we need to explicitly check if `amount` is undefined, rather than just if `amount` is truthy. We can do that by specifying a default parameter for `amount`. If `amount` is `undefined` (rather than generally falsy), the value will be set to `1`.
*/

function updateCart(name, amount = 1) {
  // amount = amount ?? 1; // alternative

  let alreadyInCart = false;

  for (let i = 0; i < shoppingCart.length; i += 1) {
    let item = shoppingCart[i];

    if (item.name === name) {
      item.amount = amount;
      alreadyInCart = true;
      break;
    }
  }

  if (!alreadyInCart) {
    shoppingCart.push({ name, amount });
  }
}
