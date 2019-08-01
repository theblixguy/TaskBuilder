//
//  Passthrough.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

final class Passthrough<T: Task>: Task {
	var task: T
	var completionBlock: Completion
	var passthroughBlock: (T) -> Task

	init(task: T, _ passthroughBlock: @escaping (T) -> Task) {
		self.task = task
		self.passthroughBlock = passthroughBlock
		self.completionBlock = nil
	}

	func perform() {
		task.completionBlock = innerCompletionBlock
		task.perform()
	}

	private func innerCompletionBlock() {
		let result = passthroughBlock(task)
		result.perform()
		completionBlock?()
	}
}
