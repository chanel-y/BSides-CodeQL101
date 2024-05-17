# DataFlow

## Why use Dataflow?
Up until this point, most of the queries we've created can also be done much more easily with other static analysis tools, or even just CTRL-F-ing through a program. But what sets CodeQL apart from these other tools is the ability to write queries that track dataflow throughout a program. 

## How do you use Dataflow?
The syntax for a dataflow query is as follows: 

```
import csharp

module MyFlowConfiguration implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    ...
  }

  predicate isSink(DataFlow::Node sink) {
    ...
  }
}

module MyFlow = DataFlow::Global<MyFlowConfiguration>;

from DataFlow::Node source, DataFlow::Node sink
where MyFlow::flow(source, sink)
select source, "Dataflow to $@.", sink, sink.toString()
```

When writing a dataflow query, you need to identify your source and sink using the isSource and isSink predicates. For example, your source could be a hardcoded string, or user input. 

A common pattern for dataflow is to define the source and sink as abstract classes, then use the instanceof keyword in the isSource and isSink predicates.

```
abstract class Sink extends Expr {}

module MyFlowConfiguration implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    source instanceof RemoteFlowSource
  }

  predicate isSink(DataFlow::Node sink) {
    sink instanceof Sink
  }
}

```
## RemoteFlowSource
RemoteFlowSource is a useful built-in class that . You can see more details on what classes are modeled [here](https://github.com/github/codeql/blob/main/csharp/ql/lib/semmle/code/csharp/security/dataflow/flowsources/Remote.qll)


## DataFlow vs TaintTracking
There's two types of Dataflow: normal dataflow and tainttracking

Tainttracking will cover the case where 


## In this Exercise
Le'ts write a query that checks for cases where you create an [RSA object](https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.rsa?view=net-8.0) using a key value of less than 2048 bits. The sample code from this exercise is in the "RSAInsufficientKeySize.cs" file in the sample project.


**Exercise**: Write a query that looks for SQL injection. In 


<details>
<summary>How do I dropdown?</summary>
<br>
This is how you dropdown.
</details>

## Further Reading
 - [Analyzing data flow in C#](https://codeql.github.com/docs/codeql-language-guides/analyzing-data-flow-in-csharp/)
 - 