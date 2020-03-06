//
//  TaskBuilder.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

@_functionBuilder public struct TaskBuilder {
	static func buildBlock() -> Task {
		return MultipleTasks(tasks: [])
	}

	static func buildBlock(_ task: Task) -> Task {
		return SingleTask(task: task)
	}

	static func buildBlock(_ tasks: Task...) -> Task {
		return MultipleTasks(tasks: tasks)
	}
}
