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

 abstract class WeakHash extends Expr { 
    abstract string getMessage();
 }
 class SHA1MethodCall extends WeakHash, MethodCall {
 	SHA1MethodCall() {
 		this.getTarget().hasFullyQualifiedName("System.Security.Cryptography.SHA1", "Create")
 	}
    override string getMessage() { result = "Please use the SHA256.Create() method instead" }
 }
class SHA1ObjectCreation extends WeakHash, ObjectCreation {
    SHA1ObjectCreation(){
        this.getTarget().hasFullyQualifiedName("System.Security.Cryptography.SHA1CryptoServiceProvider", "SHA1CryptoServiceProvider")
    }
    override string getMessage() { result = "Please use the SHA256CryptoServiceProvider instead." }
}

from WeakHash wh 
select wh, "SHA1 is considered weak and should not be used for cryptographic purposes. " + wh.getMessage()