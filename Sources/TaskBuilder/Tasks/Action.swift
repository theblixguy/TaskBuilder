//
//  Action.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

/// A `Task` that represents an action, such as calling a method, posting a notification, etc.
/// It cannot execute another `Task` or return a value.
public final class Action: Task {
	public var completionBlock: Completion = nil
	private let blockToExecute: Completion

	public init(_ blockToExecute: Completion = nil) {
		self.blockToExecute = blockToExecute
	}

	public func perform() {
		blockToExecute?()
		completionBlock?()
	}
}
