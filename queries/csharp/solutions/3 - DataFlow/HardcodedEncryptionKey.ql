/**
 * @name Hard-coded encryption key
 * @description The .Key property or rgbKey parameter of a SymmetricAlgorithm should never be a hard-coded value.
 * @kind problem
 * @id cs/hardcoded-key
 * @problem.severity error
 * @security-severity 8.1
 * @tags security
 *       external/cwe/cwe-320
 */

import csharp

abstract class KeySink extends DataFlow::Node {}

class KeyPropertyAssignmentSink extends KeySink {
  KeyPropertyAssignmentSink() {
    exists( AssignExpr ae, PropertyCall pc | 
      this.asExpr() = ae.getRValue() and 
      pc = ae.getLValue() and
      pc.getProperty().getName() = "Key"
    )
  }
}

class CreateEncryptorArgumentSink extends KeySink {
  CreateEncryptorArgumentSink() {
    exists( MethodCall mc | 
      this.asExpr() = mc.getArgumentForName("rgbKey") and 
      mc.getTarget().hasFullyQualifiedName("System.Security.Cryptography.SymmetricAlgorithm", "CreateEncryptor")
    )
  }
}

 module HardcodedKeyConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node src) { src.asExpr() instanceof StringLiteral }
  predicate isSink(DataFlow::Node sink) { sink instanceof KeySink }
}
module HardcodedKeyFlow = DataFlow::Global<HardcodedKeyConfig>;
 
 from DataFlow::Node source, DataFlow::Node sink
 where HardcodedKeyFlow::flow(source, sink)
 select sink, "Hardcoded encryption key flows to this sink."