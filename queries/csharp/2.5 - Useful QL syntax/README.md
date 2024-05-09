# Useful QL Syntax

## Exists

## instanceof

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

somestring = ""
Assembly.GetTYpe(somestring)


## Further Reading
 - [QL Language Reference](https://codeql.github.com/docs/ql-language-reference/)
 - 