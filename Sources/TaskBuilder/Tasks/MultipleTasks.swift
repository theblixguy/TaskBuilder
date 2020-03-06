//
//  MultipleTasks.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

internal final class MultipleTasks: Task {
	let tasks: [Task]
	var completionBlock: Completion
	var completedTaskCount: Int = 0

	init(tasks: [Task], completionBlock: Completion = nil) {
		self.tasks = tasks
		self.completionBlock = completionBlock
	}

	func perform() {
		for var task in tasks {
			let _taskCompletionBlockCopy = task.completionBlock
			task.completionBlock = { [weak self] in
				_taskCompletionBlockCopy?()
				self?.innerCompletionBlock()
			}
			task.perform()
		}
	}

	private func innerCompletionBlock() {
		completedTaskCount += 1

		if completedTaskCount == tasks.count {
			completionBlock?()
			completedTaskCount = 0
		}
	}
}
