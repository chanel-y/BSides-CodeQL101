# Types and Predicates

## What are Types? 

The builtin types are: boolean, float, int, string, and date. 

Like the MethodCall type that we used in the last section, CodeQL comes with many predefined classes. The (API documentation)[https://codeql.github.com/codeql-standard-libraries/csharp/] is a generated list of all of them and their predicates.

You can also define your own custom types, using the following syntax: 

```
class OneTwoThree extends int {
  OneTwoThree() { // characteristic predicate
    this = 1 or this = 2 or this = 3
}
```


**Exercise:** Using the query written in the last exercise, create a class that finds 

### Abstract Types
Abstract classes have the following syntax: 

```
abstract class NumbersILike extends int {

}

class OneTwoThree extends NumbersILike {
  OneTwoThree() {
    this = 1 or this = 2 or this = 3
  }
}

class SeventeenFiftyTwelve extends NumbersILike {
  SeventeenFiftyTwelve() {
    this = 17 or this = 15 or this = 12
  }
}

```

Some 

**Exercise:** Write an abstract class that combines both queries from the last exercise (`SHA1.Create();` and ` new SHA1CryptoServiceProvider()` ) . 

## What are Predicates?

## In this Exercise
In the last section, we created three queries to catch three different ways to use SHA1 in csharp. Now, let's create a single type that will define all three.

## Bonus Exercise: TODO Comments
Write a query that finds all comments with "TODO"



## Bonus Exercise: Empty Catch Block
Write a query that finds all try-catch clauses where the catch block is empty

## Further Reading
 - [Predicates](https://codeql.github.com/docs/ql-language-reference/predicates/)
 - [Types](https://codeql.github.com/docs/ql-language-reference/types/)