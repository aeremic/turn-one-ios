//
//  ChampionshipDataProvider.swift
//  turn-one
//
//  Created by Andrija Eremić on 31.10.24..
//

import Foundation
import Combine

class ChampionshipDataProvider: ObservableObject {
	@Published private(set) var isLoading: Bool = false
	@Published var championships: [Championship] = []
	
	func fetchChampionships() throws {
		guard let url = URL(string: "\(Api.baseUrl)/championships/") else {
			throw GenericError.genericRuntimeError("Connection to API failed.")
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			DispatchQueue.main.async {
				self.isLoading.toggle()
			}
			
			guard let data = data, error == nil else { return }
			
			let championships = JsonProvider().decode([Championship].self, from: data)
			
				// execute task on main thread asynchronously.
				// it doesnt block the queue and main UI thread since it is async.
				/// The primary use of DispatchQueue.main.async is when you have code running on a background queue and
				/// you need a specific block of code to be executed on the main queue.
			DispatchQueue.main.async {
				self.championships = championships ?? []
				self.isLoading.toggle()
			}
		}.resume()
	}
}
