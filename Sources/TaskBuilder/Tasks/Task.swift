//
//  Task.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

public protocol Task {
	typealias Completion = (() -> Void)?
	/// The completion block, to be called after the task has finished running
	var completionBlock: Completion { get set }
	/// Execute the task
	func perform()
}

/// An enum which describes the current state of a `Task`
public enum TaskState {
	/// The `Task` has not been started yet
	case notStarted
	/// The `Task` is currently running
	case running
	/// The `Task` is currently paused and not running
	case paused
	/// The `Task` has finished executing successfully
	case finished
	/// The `Task` either failed to execute or it finished executing but the result was a failure
	case failed
}

/// A top-level task that cannot be nested inside a task.
protocol TopLevelTask: Task {}
