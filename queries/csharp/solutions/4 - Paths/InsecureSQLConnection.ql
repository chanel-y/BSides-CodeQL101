/**
 * @name Insecure SQL connection
 * @description Using an SQL Server connection without enforcing encryption is a security vulnerability.
 * @kind path-problem
 * @id cs/insecure-sql-connection
 * @problem.severity error
 * @precision medium
 * @tags security
 *       external/cwe/cwe-327
 */
import csharp
import InsecureSqlConnection::PathGraph

module InsecureSqlConnectionConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    exists(string s | s = source.asExpr().(StringLiteral).getValue().toLowerCase() |
      s.matches("%encrypt=false%")
    )
  }
  predicate isSink(DataFlow::Node sink) {
    exists(ObjectCreation oc |
      oc.getRuntimeArgument(0) = sink.asExpr() and
      oc.getType().getName() = "SqlConnectionStringBuilder"
    )
  }
}

module InsecureSqlConnection = DataFlow::Global<InsecureSqlConnectionConfig>;
from InsecureSqlConnection::PathNode source, InsecureSqlConnection::PathNode sink
where InsecureSqlConnection::flowPath(source, sink)
select sink.getNode(), source, sink,
  "$@ flows to this SQL connection and does not specify `Encrypt=True`.", source.getNode(),
  "Connection string"