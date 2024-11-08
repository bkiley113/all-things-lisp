# Chapter One of COMMON LISP: A Gentle Introduction to Symbolic Computation

*What does this chapter entail?*
- Arithmetic Functions: +, -, *, /, ABS, SQRT
- Predicates: NUMBERP, SYMBOLP, ZEROP, ODDP, EVENP, >, <, EQUAL, NOT

## 1.2: Functions on Numbers

### Lisp Arithmetic Primitives

```
+	Adds two numbers
-	Subtracts second number from first
*	Multiplies two numbers
/	Divides the first number by the second
ABS	Absolute value of a number
SQRT	Square root of a number

```

These primitives behave something like this:

```	
	 _______
2 ----->|       |
  	|   +	|
3 ----->|	|-----> 5
  	|_______|
```

### Kinds of Numbers

There are integers, floating point numbers, and ratios.
Common lisp simplifies these ratios to use the smallest possible denominator.

*Calling an arithmetic function with two integer inputs will usually produce and integer or ratio result*
*Using a mixture of integers and floats yields a float result*

### Symbols

```
integer	- A sequence of digits 0-9, optionally preceded by "+" or "-"

symbol	- Any sequence of letters/digits/permissible special character that is not a number.

```


### T and NIL

These are two special symbols, as follows:

```
**T**		- Truth, "yes"

***NIL***	- Falsity, emptiness, "no"

```

Yes or no functions that return these symbols are called **predicates**.


### Some Simple Predicates

Most Lisp predicates (question answering functions) follow naming convention:

```
NUMBERP		- Is <input> a number?
SYMBOLP		- Is <input> a symbol?
ZEROP		- Is <input> zero?
ODDP		- Is <input> odd?
EQUALP		- Is <input1> equal to <input2>

some exceptions from the convention:

<    		- Is <input1> less than <input2>?
>		- The function of this predicate is left as an exercise to the reader :p
```

Not all predicates follow this convention, but here 'P' stands for 'predicate'


### Putting Functions Together

We can put primitives and predicates together to do more complex things.

For instance:

```
	       ADD1:
	________________
       |      _______   |
   n ------> |       |  |
       |     |   +   |-----> n + 1
       | 1-->|       |  |
       |      -------   |
        ----------------
```

We can write TWOP two ways:

```
	       TWOP (1):
	________________
       |      _______   |
   n ------> |       |  |
       |     | EQUAL |-----> T or NIL
       | 2-->|       |	|
       |      -------	|
	----------------
```

or

```
               TWOP (2):
        _________________________________
       |      _______           _______  |
   n ------> |       |         |       | |
       |     |   -   |-->n-2-->| ZEROP |------> T or NIL
       | 2-->|       |         |       | |
       |      -------           -------  |
        ---------------------------------
```


### The NOT Predicate

The NOT predicate turns T into NIL, and NIL into T.
It is helpful that the only way to say "no" in Lisp is NIL, everything else is treated as "yes."
Examples:

```
	 _______ 
        |       |
 T----->|  NOT  |
        |       |-----> NIL
         -------

```

```
	 _______
        |       |
 NIL--->|  NOT  |
        |       |----->	T
	 -------

```

```
	 _______
        |       |
 12---->|  NOT  |
        |       |----->	NIL
	 -------

```

```
	  _______
         |       |
BRANDON->|  NOT  |
         |       |----->NIL
	  -------

```

### NEGATING A PREDICATE

The NOT predicate can be combined with other predicates to create more complex behavior.

```
                    NOT-EQUAL:
        _________________________________
       |      _______           _______  |
    -------->|       |   NIL   |       | |  NIL
       |     | EQUAL |-------->|  NOT  |-------->
    -------->|       |    T    |       | |   T
       |      -------           -------  |
        ---------------------------------
```


### NUMBER OF INPUTS TO A FUNCTION

Some functions like ODDP, EVENP, ONEP, etc. require exactly ONE input.

Some like EQUAL require two.

Many accept variable numbers of inputs: the arithmetic functions +, -, *, and / accept any number of inputs.


*What happens with single inputs for a function?*

```
      1-Input Subtraction
	_____
  4 -->|  -  |--> -4
   	-----

```

### BASIC ERROR TYPES

/ cannot divide by zero.

EQUAL requires no fewer than two inputs.

ODDP requires no more than one input.

Can you think of some more examples?