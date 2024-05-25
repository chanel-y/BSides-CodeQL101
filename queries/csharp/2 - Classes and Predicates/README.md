# Types and Predicates

In the last sections, we've used and gotten familiar with the built-in types and predicates codeql provides, but now let's go more in depth, and learn how to define our own. 

## What are Types? 

The builtin types are: boolean, float, int, string, and date. 

Like the MethodCall and ObjectCreation types that we used in the last section, CodeQL comes with many predefined classes. The [API documentation](https://codeql.github.com/codeql-standard-libraries/csharp/) is a generated list of all of them and their predicates.

You can also define your own custom types, using the following syntax: 

```
class OneTwoThree extends int {
  OneTwoThree() { // characteristic predicate
    this = 1 or this = 2 or this = 3
  }

}
```


**Exercise:** Using the query written in the last exercise, create a class named WeakHash that finds all calls to `System.Security.Cryptography.SHA1.Create`

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

**Exercise:** Write an abstract class that combines both queries from the last exercise - `SHA1.Create();` and ` new SHA1CryptoServiceProvider()` 

## What are Predicates?
Predicates are to functions what types are to classes in CodeQL. 

Predicates can either return a result. For example: 

```
int getNumberString(int i){
  i = 1 and result = "one" or 
  i = 2 and result = "two" or 
  i = 3 and result = "three"
}

```

or they can evaluate to true or false. For example:
```
predicate isNumberILike(int i){
  result in [1,2,3]
}

```

Types can also have member predicates. Using the previous class above, we can add a member predicate like so: 

```
class OneTwoThree extends int {
  OneTwoThree() { // characteristic predicate
    this = 1 or this = 2 or this = 3
  }

  predicate isEven(){
    this = 2
  }

  string getString(){
    this = 1 and result = "one" 
    or
    this = 2 and result = "two" 
    or 
    this = 3 and result = "three"
  }

}
```

**Exercise**: Create a class named "TODOComment", and rewrite your query from the last section so that the select statement looks like:

```
from TODOComment todo
select todo, "TODO comment"
```

**Exercise**: Create a class named "Empty Try Catch", and rewrite your query from the last section so that the select statement looks like:

```
from EmptyTryCatch c
select c, "Empty Try-Catch clause"
```


## Further Reading
 - [Predicates](https://codeql.github.com/docs/ql-language-reference/predicates/)
 - [Types](https://codeql.github.com/docs/ql-language-reference/types/)