# Chapter Two of COMMON LISP: Lists

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