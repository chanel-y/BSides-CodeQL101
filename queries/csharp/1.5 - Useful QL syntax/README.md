# Useful QL Syntax

## Exists
This is the *most* useful QL syntax. It's sort of used as an equivalent to 'if' in most programming languages. 

For example:


## instanceof
This is another useful ql keyword, often used as a way to abstract 

## casting


## in 
You can check if a value is in a range of values using the "in" keyword, using the syntax: 

`<expression> in <range>`

For example: 

```
class OneTwoThreeFour extends int{
    OneTwoThreeFour(){
        this in [1..4]
    }
}
```

and

```
class SuspiciousVariableName extends string{
    SuspiciousVariableName(){
        this in ["password", "token", "key", "secret"]
    }
}
```

## Bonus: .getQualifier
This isn't necessarily ql syntax, but a useful predicate that


**Exercise**: Write a query that finds all comments with "TODO"

**Exercise**: Write a query that finds all try-catch clauses where the catch block is empty

## Further Reading
 - [QL Language Reference](https://codeql.github.com/docs/ql-language-reference/)
 - 