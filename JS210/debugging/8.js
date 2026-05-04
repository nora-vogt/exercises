// Roles (salary still to be determined)

const ceo = {
  tasks: ['company strategy', 'resource allocation', 'performance monitoring'],
  salary: 0,
};

const developer = {
  tasks: ['turn product vision into code'],
  salary: 0,
};

const scrumMaster = {
  tasks: ['organize scrum process', 'manage scrum teams'],
  salary: 0,
};

// Team -- we're hiring!

const team = {};

team['ceo'] = 'Kim';
team['scrumMaster'] = 'Alice';
team['developer'] = undefined;

const company = {
  name: 'Space Design',
  team,
  projectedRevenue: 500000,
};

console.log(`----{ ${company.name} }----`);
console.log(`CEO: ${company.team[ceo]}`);
console.log(`Scrum master: ${company.team[scrumMaster]}`);
console.log(`Projected revenue: $${company.projectedRevenue}`);

// ----{ Space Design }----
// CEO: undefined
// Scrum master: undefined
// Projected revenue: $500000

/* 
Space Design

We're putting together some information about our new company Space Design. Not all roles have been filled yet. But although we have a CEO and Scrum Master, displaying them shows undefined. Why is that?

On line 20, the variable `team` is declared and initialzied to a new object literal. On the following lines, this code attempts to assign the `ceo`, `scrumMaster`, and `developer` properties of the `team` object to the given values. 

However, the values supplied to the bracket notation for object assignment are each variables themselves. With bracket notation, the expression in the bracket is evaluated, and the evaluated result is coerced as a string and set as the key. For example, the variable `ceo` points to the object created earlier line 3. When referencing that object via its variable name, the object `{ tasks: ['company strategy', 'resource allocation', 'performance monitoring'], salary: 0 }` is returned. 

When coerced to a string, the string representation of that `ceo` object is the string `[object Object]`. That is set as the property name, with a value of `'Kim'`. 

When the next assignments take place, the respective `scrumMaster` and `developer` objects are coerced to strings the same way, so lines 23 and 24 become reassignment of the `'[object Object]'` property in `team`. `team` then has a value of `{ '[object Object]': undefined }`.

When attempting to log `console.log(`CEO: ${company.team[ceo]}`);`, `undefined` is returned. The same thing happens when attempting to log the scrumMaster. Again, the `ceo` and `scrumMaster` variables have been used in bracket notation, so the returned objects are coerced to the string `'[object Object]'`, which returns the value associated with that key in our object. 

To fix this, we can add quotation marks around the key name when performing object assignment, which makes it clear we are setting the property name as a string, rather than as the evaluated result of a variable:

```js
const team = {};

team['ceo'] = 'Kim';
team['scrumMaster'] = 'Alice';
team['developer'] = undefined;
```

Then, when accessing those keys, we need to use either the string with bracket notation or dot notation:

```js
   console.log(`CEO: ${company.team['ceo']}`);
   console.log(`Scrum master: ${company.team['scrumMaster']}`);

// alternative
   console.log(`CEO: ${company.team.ceo}`);
   console.log(`Scrum master: ${company.team.scrumMaster}`);
```

*/
