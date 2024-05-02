/**
 * @name Detects use of binary deserialization
 * @description Binary deserialization can trivially be exploited and all usage should be replaced
 * @kind problem
 * @tags security
 *       external/cwe/cwe-502
 * @precision very-high
 * @id cs/dangerous-binary-deserialization-demo
 * @problem.severity error
 */

import csharp

class Deserialize extends MethodCall{
    Deserialize(){
        this.getTarget().hasFullyQualifiedName("System.Runtime.Serialization.Formatters.Binary.BinaryFormatter", "Deserialize")
    }
}

from Deserialize deserialize
select deserialize, "BinaryFormatter.Deserialize() is called here"