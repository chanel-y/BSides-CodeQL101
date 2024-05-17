# Paths

## Why use Path Queries? 
Path queries are functionally the same as dataflow queries, but are incredibly useful for debugging during the query-writing process, and for cases when knowing where the dataflow is coming from will be useful for the alert. 

## How to use path queries
This is the syntax for a path-problem query

```
/**
 * ...
 * @kind path-problem
 * ...
 */

import csharp

...

module Flow = DataFlow::Global<MyConfiguration>;
import Flow::PathGraph

from Flow::PathNode source, Flow::PathNode sink
where Flow::flowPath(source, sink)
select sink.getNode(), source, sink, "<message>"
```

## In this Exercise




**Exercise:** Using the instructions above, convert the RSA Insufficient Key Size and Hardcoded Encryption Key queries into path queries

**Exercise:** Write a query to find cases where 

