#EVAL Notation
*Instead of using the funky boxes to represent functions like we have been, we will use lists.*

## 3.1: THE EVAL FUNCTION

Consider the expression of some familiar functions in EVAL notation below. 

```
(+ 1 6)              => 7

(oddp (+ 1 6))       => t

(* 3 (+ 1 6))        => 21

(/ (* 2 11) (+ 1 6)) => 22/7

(not (equal 5 6))    => t
```
The left input is the first input and the right input is the second input.

## 3.4: EVALUATION RULES

*Evaluation Rule for Numbers, T, and NIL*:
Numbers, and the symbols T and NIL evaluate to themselves.

*Evaluation Rule for Lists:
The first element of the list specifies a function to be called. The remanining elements specify arguments to the function.

## 3.5 DEFINING FUNCTIONS IN EVAL NOTATION

Consider writing a function to find the average of two numbers.
```
(defun average (x y)
  (/ (+ x y) 2.0))
```
DEFUN is a *macro function*, which does not evaluate its arguments. Rather, the first input is the name of the function. The second input is the argument list.

Consider a function to find the square of a number.
```
(defun square (x)
  (* x x))
```


## 3.7 EVALUATING SYMBOLS

*Evaluation Rule for Symbols*
A symbol evaluates to the value of the variable it refers to.

Consider PI, a global variable built into Common Lisp, and EGGPLANT, some bullshit unassigned variable we just made up.

The evaluations are as follows:
```
pi       => 3.14159
EGGPLANT => Error! EGGPLANT unassigned variable.
```

## 3.8 QUOTED OBJECTS AND SYMBOLS/LISTS AS DATA

Try to reason through these examples, they are fairly self-explanatory. 

```
(equal kirk spock)   => Error! KIRK unassigned variable.
(equal 'kirk 'spock) => nil



(defun riddle (x y)
  (list 'why 'is 'a x 'like 'a y))
(riddle 'raven 'writing-desk) =>
  (why is a raven like a writing desk)
```
**Evaluation rule for Quoted Objects:**
A quoted object evaluates to the object itself without the quote.



 
