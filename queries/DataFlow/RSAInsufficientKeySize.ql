/**
 * @name RSA Key creation with an insufficient key length
 * @description Finds creation of RSA that explicitly have insufficient key size
 * @kind problem
 * @tags security
 *       external/cwe/cwe-502
 * @precision very-high
 * @id cs/rsa-key-creation-insufficient-key-length-demo
 * @problem.severity error
 */

 import csharp

 from Class c 
 select c, "this is a class"