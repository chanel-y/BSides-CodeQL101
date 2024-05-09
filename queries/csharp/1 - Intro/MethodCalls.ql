/**
 * @name Finds MethodCalls
 * @description Finds MethodCalls
 * @kind problem
 * @precision very-high
 * @id cs/method-calls
 * @problem.severity error
 */

import csharp

from MethodCall mc 
select mc, "this is a methodcall"