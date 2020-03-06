import XCTest
@testable import TaskBuilder

final class TaskBuilderTests: XCTestCase {
	func test_unpack() {
		let unpackedTasks1 = taskWithTwoSubtasks().unpack()
		let unpackedTasks2 = taskWithThreeSubtasks().unpack()
		XCTAssertEqual(unpackedTasks1.count, 2)
		XCTAssertEqual(unpackedTasks2.count, 3)
	}

	func test_actionTaskCallsCompletionBlock() {
		let expectation = self.expectation(description: "Block is called")
		let taskToExecute = simpleTaskWithCompletion {
			expectation.fulfill()
		}
		XCTAssertEqual(taskToExecute.unpack().count, 1)
		taskToExecute.perform()
		wait(for: [expectation], timeout: 1)
	}

	func test_actionTaskCallsCompletionBlock_passthrough() {
		let expectation = self.expectation(description: "Block is called")
		let taskToExecute = simpleTaskWithPassthroughCompletion {
			expectation.fulfill()
		}
		XCTAssertEqual(taskToExecute.unpack().count, 3)
		taskToExecute.perform()
		wait(for: [expectation], timeout: 1)
	}

	private func taskWithTwoSubtasks() -> Task {
		Do {
			Action { print("A") }
			Action { print("B") }
		}
	}

	private func taskWithThreeSubtasks() -> Task {
		Do {
			Passthrough(task: Action { print("C") }) { task in
				Action { print("D") }
			}
			Action { print("A") }
			Action { print("B") }
		}
	}

	private func simpleTaskWithCompletion(block: @escaping () -> ()) -> Task {
		Do {
			Action(block)
		}
	}

	private func simpleTaskWithPassthroughCompletion(block: @escaping () -> ()) -> Task {
		Do {
			Action { print("A") }
			Action { print("B") }
			Passthrough<Action>(task: Action { print("C") }) { task in
				Action(block)
			}
		}
	}

	static var allTests = [
		("test_unpack", test_unpack),
		("test_actionTaskCallsCompletionBlock", test_actionTaskCallsCompletionBlock),
		("test_actionTaskCallsCompletionBlock_passthrough", test_actionTaskCallsCompletionBlock_passthrough)
	]
}

extension TaskBuilderTests {
	final class TestOperation: Operation {}
}
