/* 
Inventory Item Availability

Building on the previous exercise, write a function that returns true or false based on whether or not an inventory item is available. As before, the function takes two arguments: an inventory item and a list of transactions. The function should return true only if the sum of the quantity values of the item's transactions is greater than zero. Notice that there is a movement property in each transaction object. A movement value of 'out' will decrease the item's quantity.

You may (and should) use the transactionsFor function from the previous exercise.

INPUT: inventory item ID, transaction array
OUTPUT: boolean
  - true if the sum of the quantity values of an item's transactions is greater than 0

RULES:
- each item id may have multiple transaction objects
- transactions with movement 'in' increase quantity, 'out' decreases quantity.

ALGORITHM:
- filter the transaction list for transactions matching the given item ID
- sum the quantity of those transactions
  - start quanity at zero
  - if movement is in:
    - increment quantity
  - if movement is out
    - decrement quantity
- reutrn if quantity is greater than 0
*/

function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(({id}) => id === inventoryItem);
}

function isItemAvailable(inventoryItem, transactions) {
  let itemTransactions = transactionsFor(inventoryItem, transactions);
  let finalQuantity = itemTransactions.reduce((result, {movement, quantity}) => {
    if (movement === 'in') {
      return result + quantity;
    } else {
      return result - quantity;
    }
  }, 0);

  return finalQuantity > 0;
}


const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true
