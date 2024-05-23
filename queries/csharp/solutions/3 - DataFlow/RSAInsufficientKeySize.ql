/**
 * @name RSA Key creation with an insufficient key length
 * @description Finds creation of RSA that explicitly have insufficient key size
 * @kind problem
 * @tags security
 *       external/cwe/cwe-502
 * @precision very-high
 * @id cs/rsa-key-creation-insufficient-key-length-demo-solution
 * @problem.severity error
 */

 import csharp

  module FlowsFromInsufficientSizeToRSACreationFlow = DataFlow::Global<FlowsFromInsufficientSizeToRSACreation>;
  
  module FlowsFromInsufficientSizeToRSACreation implements DataFlow::ConfigSig {
    predicate isSource(DataFlow::Node source) { source.asExpr().(IntegerLiteral).getValue().toInt() < 2048 }
  
    predicate isSink(DataFlow::Node sink) {
      exists(MethodCall mc | 
        mc.getTarget().hasFullyQualifiedName("System.Security.Cryptography.RSA", "Create") and 
        sink.asExpr() = mc.getAnArgument()
      )
    }
  }
  
  from
     DataFlow::Node source, DataFlow::Node sink
  where
    FlowsFromInsufficientSizeToRSACreationFlow::flow(source, sink)
select sink, "Weak asymmetric encryption algorithm. RSA creation with a $@ is banned by the SDL. Switch to a RSA with at least 2048 key size, ECDH or ECDSA algorithm instead.",
    source, "key length < 2048bits"