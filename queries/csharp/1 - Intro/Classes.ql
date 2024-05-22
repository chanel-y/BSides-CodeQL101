/**
 * @name Finds Classes
 * @description Finds Classes
 * @kind problem
 * @precision very-high
 * @id cs/find-classes
 * @problem.severity error
 */

import csharp

from MethodCall mc
where mc.getTarget().hasFullyQualifiedName("System.Security.Cryptography.SHA1","Create")
select mc, "Call to SHA1, SHA1 is a weak hash function"