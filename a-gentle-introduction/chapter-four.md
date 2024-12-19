# Chapter Four: CONDITIONALS

## The IF Function

The IF function takes three arguments -> a test, a true part, and a false part

If the test is true, it returns the the true part; if false, returns the false part.

```
(if (oddp 1) 'odd 'even)  => odd
(if (oddp 2) 'odd 'even)  => even


(if t   'test-was-true 'test-was-false) => test-was-true
(if nil 'test-was-true 'test-was-false) => test-was-false

(if (symbolp 'foo) (* 5 5) (+ 5 5)) => 25
(if (symbolp  1  ) (* 5 5) (+ 5 5)) => 10

```

## IF Example: Absolute Value
```
(defun my-abs (x)
  (if (< x 0) (-x) x))
```

In English, if the number is less than zero, it is negative (so we evaluate the true part), so we return its positive negation. If it is not, we are done, and simply return the number.


## More on IF

IF can be given two inputs, that is, if we give it a test and a true part, the false part becomes NIL.

```
(if t   'happy) => happy
(if nil 'happy) => nil
```

Some examples:

4.1.1 MAKE-EVEN Function
```
(defun make-even (x)
  (if (oddp x) (+ x 1) x))
```

4.1.2 FURTHER Function
This will make a positive number larger by adding 1 to it, make a negative number smaller by subtracting 1 from it.
```
(defun further (x)
  (if (zerop x)
    0             ; If given zero, return zero
	(if (< x 0)   
	    (- x 1)   ; If nonzero negative, subtract 1 from x
		(+ x 1)   ; If nonzero positive, add 1 to x
	  )
  )
)
```

4.1.3 Rewrite NOT using IF

```
(defun my-not (x)
  (if x
      nil
	  t))

```

4.1.4 Function that takes two numbers and outputs them in ascending order

```
(defun ordered (x y)
  (if (< x y)
  	  (list x y)
	  (list y x)))
```

## The COND Macro (Simplified)

COND runs through test-and-consequent clauses. If the any given clause has a test that is TRUE, it returns the consequent and NO OTHER clauses.

If a test is false, it skips the consequent and goes to the next clause.

It pretty much acts as a 'do something until you get it right' process.

```
(COND (test-1 consequent-1)
	  (test-2 consequent-2)
	   ....
	  (test-n consequent-n))
```

If no test is true, we return NIL.

Consider the following COMPARE function.
```
(defun compare (x y)
  (cond ( (eq x y) 'numbers-equal)
  		( (< x y ) 'first-is-smaller)
		( (> x y ) 'first-is-bigger)))
```

## Using T in COND

We can use T as a way to have a guaranteed test execute.
The most logical way to utilize this is to have a T-test be called in the case that no other tests are true. That way, we return the result of this test instead of the default NIL.

Example:
```
(defun where-is (x)
  (cond ( (equal x 'paris) 'france)
  		( (equal x 'queensland) 'australia)
		( (equal x 'battambang) 'cambodia)
		(t 'unknown)))
```

If none of the known cities are inputted into the above function, we return a default of 'unknown.'

### We can write IF in terms of COND:
```
(cond (test true-part)
	  (t    false-part))
```

Consider MY-ABS written in terms of COND:
```
(defun my-abs (x)
  (cond ((< x 0) (-x) )
  		(t         x  )))
```


## AND/OR Macros

#### Rule for AND:
	 Evaluate clauses one at a time. If a clause returns NIL, stop and return NIL.
	 Otherwise, go on to the next one.
```
(and t t t nil t t) => nil
(and nil t t t)     => nil
(and nil t)         => nil

(and 'george nil 'harry) => nil
(and 'george t   'harry) => harry
(and 1 2 3 4 5)          => 5
```

### Rule for OR:
	Evaluate the clauses one at a time. If a clause returns something other than NIL, stop, return that value.
	Otherwise go on to the next clause or return NIL if none are left,

```
(or nil t t) => t
(or 'george nil 'harry) => george
(or nil 'fred 'harry)   => fred


## Building Complex Predicates

Consider the HOW-ALIKE function, this considers if two numbers are the same, have the same parity, or have the same divisibility by 2.

```
(defun how-alike (x y)
 (cond ( (equal a b) 'same-number)
 	   ( (and (oddp a) (oddpb)) 'both-odd)
	   ( (and (not (oddp a)) (not (oddp b)) ) 'both-even)
	   ( (and (< a 0) (< b 0)) 'both-negative)
	   ( (and (> a 0) (> b 0)) 'both-positive)
	   ( t 'not-alike)))

```
