//
//  File.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

final class LoadBigImageTask: Operation {
	let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")!

	override func main() {
		if isCancelled { return }

		// Testing
		guard let _ = try? Data(contentsOf: url) else { return }

		if isCancelled { return }
	}
}
