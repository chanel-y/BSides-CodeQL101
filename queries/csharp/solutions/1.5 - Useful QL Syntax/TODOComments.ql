/**
 * @name TODO comment
 * @description A comment that contains 'TODO' or similar keywords may indicate code that is incomplete or
 *              broken, or it may highlight an ambiguity in the software's specification.
 * @kind problem
 * @problem.severity recommendation
 * @precision medium
 * @id cs/todo-comment-demo-solution
 */

 import csharp

 from CommentLine c
 where c.getText().matches("%TODO%") //note: .regexpmatch is also valid here
 select c, "TODO comments should be addressed."
 