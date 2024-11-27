# Chapter Two of COMMON LISP: ListsOAA

*What does this chapter entail?*

*Lisp is an acronym for 'List Processor.' Lists are its central data type.

## 2.2 List Representation

The printed representation of a list is simple and what you would expect. For instance, their elements are contained in parentheses like so:

```
(RED GREEN BLUE)

```

However, the internal computer representation is different. Internally, lists are organized as chains of **cons cells**, linked together by pointers.

Each cons cell has two pointers, one to its element and another to the next cons cell in the chain.

Each cons cell is a small piece of memory split in two, big enough to hold two of the aforementioned pointers. Most pointers are four bytes long, so **each cons cell is eight bytes**.

Continuation of the first example, here is that list in terms of its cons cells:

```
 ___  ___     ___  ___     ___  ___
| x || x |-->| x || x |-->| x || x |---> NIL
 ---  ---     ---  ---     ---  ---
  |            |            |
  ˇ            ˇ            ˇ
 RED         GREEN         BLUE

```

## 2.4 Nested Lists

*Lists containing other lists are called nested lists*

Lists are not always uniform. This list consists of a list, a symbol, and a list:
```
((BRAIN SURGEONS) NEVER (SAY OOPS))

```
The cons cell diagram is as follows:
```
 ___  ___                        ___  ___     ___  ___
| x || x |--------------------->| x || x |-->| x || x |--> NIL
 ---  ---                        ---  ---     ---  ---
  |                               |            |
  |                               ˇ            |
  ˇ                             NEVER          ˇ
 ___  ___     ___  ___                        ___  ___     ___  ___ 
| x || x |-->| x || x |--> NIL               | x || x |-->| x || x |--> NIL
 ---  ---     ---  ---                        ---  ---     ---  --- 
  |            |                               |            |
  ˇ            ˇ                               ˇ            ˇ
BRAIN       SURGEONS                          SAY          OOPS



```

## 2.6 The Empty List

A list of zero elements is an empty list, and can be written as ().

It is represented by the symbol NIL in the computer.

However, the empty list itself IS NIL, hence something like `(A NIL B)` is equivalent to `(A () B)`.


## 2.8 FIRST, SECOND, THIRD and REST

The above are primitive functions for extracting list elements.

```
               -----------
(A B C D)---> |   FIRST   |---> A
               -----------
```

You can imagine what SECOND and THIRD do.

The REST function is the complement of FIRST.

We can use REST to create functions that extract other elements:


Consider MY-FOURTH:

```
(A B C D E F) ----> REST--(B C D E F)--> REST --(C D E F)--> REST --(D E F)--> FIRST--> (D)
```

## 2.9 Functions Operate on Pointers

Let's say we have a list which we are inputting to a function.

This is an informal notion. The list is not exactly the input.

Rather, a pointer *to* the list is the input.

Suppose (GRANDPA BACH DOES FUGUES A LOT) is supplied as an input to REST. What REST receives is a pointer to the first cons cell.

What is returned by REST is a pointer to the second cons cell, which is the first cell of the list (BACH DOES FUGUES A LOT). This pointer was extracted from the right half of the cons cell and returned as the result.


## 2.10 CAR and CDR

The left half of a cons cell is the CAR and the right half is the CDR.

These are also primitive functions in LISP.
```
(THE BIG BOPPER) --> CAR --> THE

(THE BIG BOPPER) --> CDR --> (BIG BOPPER)
```
Another exaxmple:
```
(AARDVARK) --> CAR --> AARDVARK
(AARDVARK) --> CDR --> NIL

Nested Example:
```
((PHONE HOME)) --> CAR --> (PHONE HOME)
((PHONE HOME)) --> CDR --> NIL

## 2.11 CDAR and CADR

(FEE FIE FO FUM) --> CDAR --> FIE
(FEE FIE FO FUM) --> CADR --> Error, not a list

(FEE FIE FO FUM) --> CADDR --> FO


## 2.11 CONS
```
             ______
     A ---->|      |
(B C D)---->| CONS |---> (A B C D)
             ------