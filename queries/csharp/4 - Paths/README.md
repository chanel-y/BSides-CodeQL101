# Paths

## Why use Path Queries? 


## How to use path queries
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