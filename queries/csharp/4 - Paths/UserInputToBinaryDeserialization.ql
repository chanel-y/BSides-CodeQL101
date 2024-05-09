/**
 * @name Detects use of binary deserialization with flow from user input
 * @description Binary deserialization can trivially be exploited and all usage should be replaced
 * @kind path-problem
 * @tags security
 *       external/cwe/cwe-502
 * @precision very-high
 * @id cs/dangerous-binary-deserialization
 * @problem.severity error
 */

 import csharp
 import semmle.code.csharp.security.dataflow.flowsources.Remote

 module UserInputDeserializeConfigFlow = TaintTracking::Global<UserInputDeserializeConfig>;
 import UserInputDeserializeConfigFlow::PathGraph

 module UserInputDeserializeConfig implements DataFlow::ConfigSig {
   predicate isSource(DataFlow::Node source) { source instanceof RemoteFlowSource }
 
   predicate isSink(DataFlow::Node sink) {
     exists(MethodCall mc |
        mc.getTarget().hasFullyQualifiedName("System.Runtime.Serialization.Formatters.Binary.BinaryFormatter", "Deserialize") and
        sink.asExpr() = mc.getArgument(0)     
     )
   }

   predicate isAdditionalFlowStep(DataFlow::Node pred, DataFlow::Node succ){
    pred.asExpr() = succ.asExpr().(MethodCall).getQualifier()
  }
 }

 from 
 UserInputDeserializeConfigFlow::PathNode userInput,
 UserInputDeserializeConfigFlow::PathNode deserialize
where 
 UserInputDeserializeConfigFlow::flowPath(userInput, deserialize)
select deserialize.getNode(), userInput, deserialize, "user input flows to BinaryFormatter deserialize"