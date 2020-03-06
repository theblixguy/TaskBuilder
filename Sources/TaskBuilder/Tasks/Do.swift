//
//  Do.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

/// A top-level `Task` that can contain other tasks, but not itself.
public struct Do: TopLevelTask {
	public let task: () -> Task
	public var completionBlock: Completion {
		get { fatalError("You must not call the getter") }
		set { fatalError("You must not call the setter") }
	}

	public init(@TaskBuilder task: @escaping () -> Task) {
		self.task = task
	}

	public func perform() {
		let task = self.task()
		task.perform()
	}
}
