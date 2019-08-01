//
//  Task.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

protocol Task {
	typealias Completion = (() -> Void)?

	var completionBlock: Completion { get set }
	func perform()
}
