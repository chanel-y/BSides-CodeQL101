/**
 * @name Hard-coded encryption key
 * @description The .Key property or rgbKey parameter of a SymmetricAlgorithm should never be a hard-coded value.
 * @kind path-problem
 * @id cs/hardcoded-key
 * @problem.severity error
 * @security-severity 8.1
 * @tags security
 *       external/cwe/cwe-320
 */

import csharp

abstract class KeySource extends DataFlow::Node { }
abstract class KeySink extends DataFlow::Node { }

 class ByteArrayLiteralSource extends KeySource {
    ByteArrayLiteralSource() {
       this.asExpr() = any(ArrayCreation ac |
         ac.getArrayType().getElementType() instanceof ByteType and
         ac.hasInitializer())
     }
   }
   
   class StringLiteralSource extends KeySource {
     StringLiteralSource() {
       this.asExpr() instanceof StringLiteral
     }
   }

   
module SymmetricKeyTaintTrackingConfiguration implements DataFlow::ConfigSig {
    predicate isSource(DataFlow::Node src) {
        src.asExpr() instanceof StringLiteral
    }

    /** holds if the node is a symmetric encryption key sink. */
    predicate isSink(DataFlow::Node sink) {
        sink instanceof KeySink
    }
}
module SymmetricKeyTaintTrackingConfigurationFlow = TaintTracking::Global<SymmetricKeyTaintTrackingConfiguration>;


from DataFlow::Node source, DataFlow::Node sink
where
  SymmetricKeyTaintTrackingConfigurationFlow::flow(source, sink)
select sink, "creates encryption key using a hard-coded value"