#Chapter 5: Variables and Side Effects

## The SETF Function

The SETF macro assigns a value to a variable.

Consider the following example where we set a global variable VOWELS and play around with it using other functions:

```
(setf vowels '(a e i o u))

vowels now has value (a e i o u)
```
Now, we can use VOWELS in Lisp expressions:
```
> (length vowels)
5

> (rest vowels)
(e i o u)

> vowels
(a e i o u)

> (setf vowels '(a e i o u and sometimes y))
(a e i o u and sometimes y)

> (rest (rest (rest vowels)))
(o u and sometimes y)
```

## Side Effects


