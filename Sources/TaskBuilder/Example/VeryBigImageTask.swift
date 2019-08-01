//
//  File.swift
//  
//
//  Created by Suyash Srijan on 01/08/2019.
//

import Foundation

final class VeryBigImageTask: Operation {
	let url = URL(string: "https://www.mapsland.com/maps/world/large-scale-detailed-satellite-map-of-the-world.jpg")!
	var imageData: Data?

	override func main() {
		if isCancelled { return }

		// Testing
		guard let data = try? Data(contentsOf: url) else { return }
		imageData = data

		if isCancelled { return }
	}
}
