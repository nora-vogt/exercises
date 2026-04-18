let a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);

/* 
This code will log `7`. The variable `a` is declared and initialized on line 1 with a value of `7`.

The `myValue` function is defined on lines 3-5 with one parameter, `b`. This function reassigns `b` to the result of `b + 10`. 

`myValue` is executed on line 7, passing in `a` as an argument. The value of `a` is a number, which is a primitive value, so pass-by-value is used and the function parameter `b` is assigned to a copy of the value `7`.

Within the function, the addition and reassignment is performed, changing the value of `b`. That has no bearing on the value of `a`, which is a separate variable with a separate value. Additionally, primitives are immutable, so there is no operation within the functin that can change the value of `a`.

Finally, line 8 logs the value of `a`, which is still `7`.

LS Answer:
The code logs 7 to the console. The value assigned to variable a is 7 and it is a primitive value. Primitive values in JavaScript are immutable. Therefore, passing the variable a that is assigned a primitive value as an argument to a function, and consequently using it on any operation in the body of the function does not have any effect on the value assigned to a.

Student answer:
When this program executes, a is set to the value 7. When the myValue(b) is called, passing in the variable a, it is passes as a value and not as reference to the original variable. This is because a is set to a primitive value and primitive values are immutable.

So the myValue function has no effect on the original variable. When we console.log(a) the value output will be 7.
*/
