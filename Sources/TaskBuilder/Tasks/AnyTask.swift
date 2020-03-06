//
//  File.swift
//  
//
//  Created by Suyash Srijan on 11/01/2020.
//

import Foundation

/// A type-erased `Task` value.
public struct AnyTask: Task {
	/// The `Task` to execute
	public let task: Task
	public var completionBlock: Completion

	public init<T: Task>(_ base: T) {
		self.task = base
		self.completionBlock = task.completionBlock
	}

	public func perform() {
		task.perform()
	}
}
