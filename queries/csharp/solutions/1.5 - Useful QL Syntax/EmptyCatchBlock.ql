/**
 * @name Poor error handling: empty catch block
 * @description Finds catch clauses with an empty block
 * @kind problem
 * @problem.severity recommendation
 * @precision very-high
 * @id cs/empty-catch-block
 */

 import csharp

 from CatchClause cc
 where
   cc.getBlock().isEmpty()
 select cc, "Poor error handling: empty catch block."