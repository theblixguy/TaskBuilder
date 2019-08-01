//
//  SingleTask.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

final class SingleTask: Task {
	var task: Task
	var completionBlock: Completion

	init(task: Task, completionBlock: Completion = nil) {
		self.task = task
		self.completionBlock = completionBlock
	}

	func perform() {
		task.completionBlock = completionBlock
		task.perform()
	}
}
