//
//  File.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

final class Example {
	let queue: OperationQueue = .init()

	func fetch() {
		let task = imageTask { print($0!.description) }
		queue.addTask(task)
	}

	private func imageTask(_ completion: @escaping (Data?) -> Void) -> Task {
		Do {
			Action { print("Starting...") }

			LoadBigImageTask()
			Action { print("Load big image task finished!") }

			Passthrough(task: VeryBigImageTask()) { task in
				Action { completion(task.imageData) }
			}

			Action { print("All done!") }
		}
	}
}
