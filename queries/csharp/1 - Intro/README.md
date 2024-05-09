# Intro 

## Goals
 - Find and add codeql databases to VSCode
 - Running a CodeQL query

## Part 1 - Using the AST
Exploring the AST (Abstract Syntax Tree) of your code is a really useful way to see how to translate objects in code to CodeQL. 

Right click on your codeql database in the "Databases" tab of the CodeQL VSCode extension, then select "Add Database Source to Workspace"

TODO: add image

Navigate back to File Explorer, and you'll see that the folder containing the source code of the database has been added. Open any of the file, then right click -> "CodeQL: View AST"


This will take a couple seconds to run. Once completed, open the CodeQL extension tab, and the AST will be under "AST Viewer"

**Exercise:** Click around the AST. What are the different CodeQL classes in this program? 

**Exercise:** Choose one class in the AST, and find its page in the [CodeQL Csharp Standard Library](https://codeql.github.com/codeql-standard-libraries/csharp/). What description, predicates (more on this later), and supertypes does it have? 

## Part 2 - Running your first query
### Structure of a CodeQL Query
Open up MethodCalls.ql. 

CodeQL queries are composed of two parts: metadata, and the query itself

Metadata's pretty self explanatory - this contains information about the query like its name, id, any tags, etc. 
```
/**
 * @name Finds MethodCalls
 * @description Finds MethodCalls
 * @kind problem
 * @precision very-high
 * @id cs/method-calls
 * @problem.severity error
 */
```

The structure of the query itself is very, very similar to SQL queries, where there is a from, where, and select. The select statement should select two things: the expression that you're looking for, and the message for the alert. 

```
from MethodCall mc 
select mc, "this is a methodcall"
```

**Exercise:**

## Part 3 - Writing your first query
In this exercise, we're going to take our first steps to build up to a query to find cases where SHA1 is used. 

In this Intro folder, create a file named "WeakHashSHA1.ql" , and copy this starting code: 

```
/**
 * @name Finds uses of the weak SHA1 algorithm
 * @description Finds uses of the weak SHA1 algorithm
 * @kind problem
 * @precision high
 * @id cs/sha1
 * @problem.severity error
 */

import csharp

from MethodCall mc 
select mc, "this is a methodcall"
```

Let's try and select for this case in the WeakHashes.cs file in our sample database: 
```
public byte[] Case1()
{
    SHA1 algorithm = SHA1.Create(); 
    byte[] bytes = Encoding.ASCII.GetBytes("This is a test string");
    byte[] hash = algorithm.ComputeHash(bytes);

    return hash;
}
```
Specifically, the code snippet `SHA1.Create();` , which is what actually creates the SHA1 object. 

Following the steps above, open the AST for this file. 

-- AST SNAPSHOT -- 

We can see that in CodeQL, this is a MethodCall. Update the query to: 


**Exercise**: Write a query that finds the other way SHA1 is created in this file, specifically the code snippet ` new SHA1CryptoServiceProvider()` 

## Further Reading
 - [Metadata for CodeQL queries](https://codeql.github.com/docs/writing-codeql-queries/metadata-for-codeql-queries/)
 - [CodeQL library for C#](https://codeql.github.com/codeql-standard-libraries/csharp/)