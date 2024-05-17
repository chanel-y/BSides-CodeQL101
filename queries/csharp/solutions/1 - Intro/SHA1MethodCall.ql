/**
 * @name Detects use of SHA1
 * @description SHA1 is considered weak and should not be used for cryptographic purposes
 * @kind problem
 * @tags security
 *       external/cwe/cwe-502
 * @precision very-high
 * @id cs/weak-hashes-demo-solution-1
 * @problem.severity error
 */

import csharp

from MethodCall mc 
where mc.getTarget().hasFullyQualifiedName("System.Security.Cryptography.SHA1", "Create")
select mc, "SHA1 is considered weak and should not be used for cryptographic purposes. "