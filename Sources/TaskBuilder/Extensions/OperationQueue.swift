//
//  OperationQueue.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

extension Operation: Task {
	func perform() {
		start()
	}

	/// Adds a `Task` to the operation queue and executes it. The components of a task are executed in
	/// the order in which they are declared.
	///
	/// This function assumes the following structure:
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
		precondition(task is Do)
		let container = task as! Do

		let inner = container.task()

		if !(inner is MultipleTasks) {
			// Likely a single task
			addSingleTask(inner)
			return
		}

		// If we didn't have a single top task then it means we have multiple
		// tasks
		precondition(inner is MultipleTasks)
		let multipleTasks = inner as! MultipleTasks

		// The tasks are executed in order they are declared. We add an empty
		// barrier block to achieve this.
		var iterator = multipleTasks.tasks.makeIterator()

		while let task = iterator.next() {
			addOperation(task.perform)
			addBarrierBlock({})
		}
	}

	private func addSingleTask(_ task: Task) {
		addOperation(task.perform)
	}
}
