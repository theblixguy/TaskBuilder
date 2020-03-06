//
//  Task+Unpack.swift
//  
//
//  Created by Suyash Srijan on 11/01/2020.
//

import Foundation

// TODO: Build a directed acyclic graph to represent the task heirarchy. Then,
// unpacking can be done without checking for concrete types.

public extension Task {
	func unpack() -> [Task] {
		return unpackTask(self)
	}

	private func unpackTask(_ task: Task) -> [Task] {
		switch task {
			case let task as Do:
				return unpackTask(task.task())
			case let task as SingleTask:
				return [task.task] + unpackTask(task.task)
			case let task as MultipleTasks:
				return task.tasks
			case let task as Passthrough<AnyTask>:
				return [task]
			default:
				return [task]
		}
	}
}
