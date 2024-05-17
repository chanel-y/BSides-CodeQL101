/**
 * @name Detects use of SHA1
 * @description SHA1 is considered weak and should not be used for cryptographic purposes
 * @kind problem
 * @tags security
 *       external/cwe/cwe-502
 * @precision very-high
 * @id cs/weak-hashes-demo-solution
 * @problem.severity error
 */

import csharp

from ObjectCreation oc 
where oc.getTarget().hasFullyQualifiedName("System.Security.Cryptography.SHA1CryptoServiceProvider", "SHA1CryptoServiceProvider") 
select oc, "SHA1 is considered weak and should not be used for cryptographic purposes."