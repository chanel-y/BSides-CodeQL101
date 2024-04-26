/**
 * @name Detects use of binary deserialization with flow from user input
 * @description Binary deserialization can trivially be exploited and all usage should be replaced
 * @kind problem
 * @tags security
 *       external/cwe/cwe-502
 * @precision very-high
 * @id cs/dangerous-binary-deserialization-user-input-demo
 * @problem.severity error
 */

 import csharp

 from Class c 
 select c, "this is a class"