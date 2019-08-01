//
//  Action.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

final class Action: Task {
	var completionBlock: Completion

	init(completionBlock: Completion = nil) {
		self.completionBlock = completionBlock
	}

	func perform() {
		completionBlock?()
	}
}
