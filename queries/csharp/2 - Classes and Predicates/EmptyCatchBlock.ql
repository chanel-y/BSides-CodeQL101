 /**
 * @name Catch throws new exception
 * @description Finds all catch handlers that create a new exception that is not derived from the caught exception
 *              This can make errors harder to diagnose.
 * @kind problem
 * @id cs/catch-throws-new-exception
 * @problem.severity warning
 * @precision high
 * @tags maintainability
 *       language-features
 *       exceptions
 */

 import csharp

 class CatchThatThrows extends CatchClause {
     CatchThatThrows() {
         exists (ThrowStmt th, ObjectCreation e
         | th = this.getBlock().getAChildStmt+()
         | e = th.getExpr())
     }
     
     ObjectCreation getThrownExpr() {
         exists (ThrowStmt th
         | th = this.getBlock().getAChildStmt+()
         | result = th.getExpr())
     }
 }
 
 from CatchThatThrows catch, ObjectCreation newThrownException
 where newThrownException = catch.getThrownExpr() and
             not newThrownException.getAnArgument() = catch.(SpecificCatchClause).getVariable().getAnAccess()
 select catch, "Catch ("+catch.getCaughtExceptionType()+") throws new exception " + newThrownException.getObjectType()
 