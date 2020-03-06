//
//  OperationQueue.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

extension Operation: Task {
	/// Perform this task
	public func perform() {
		start()
	}
}

public extension OperationQueue {
	/// Adds a `Task` to the operation queue and executes it. The task and its sub-tasks (if present) are
	/// executed in the order in which they are declared.
	///
	/// For example:
	/// ```
	///  Do {
	///   // task 1
	///   // task 2
	///   // ...
	///  }
	/// ```
	///
	/// - Parameter task: The task to execute in the operation queue
	func addTask(_ task: Task) {
		precondition(task is TopLevelTask,
								 "All tasks must start with a top-level task")

		let tasksToAdd = task.unpack()
		var iterator = tasksToAdd.makeIterator()

		while let task = iterator.next() {
			addOperation(task.perform)
			addBarrierBlock({})
		}
	}
}
