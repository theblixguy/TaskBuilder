//
//  Do.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

struct Do: Task {
	let task: () -> Task
	var completionBlock: Completion = nil

	init(@TaskBuilder task: @escaping () -> Task) {
		self.task = task
	}

	func perform() {
		fatalError("Do not call")
	}
}
