//
//  JsonProvider.swift
//  turn-one
//
//  Created by Andrija Eremić on 20.8.24..
//

import Foundation

struct JsonProvider {
	private let defaultDateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
	private let stylizedDateFormat = "MMM d, h:mm a"
	
	private var decoder : JSONDecoder
	private var dateFormatter : DateFormatter
	
	init() {
		decoder = JSONDecoder()
		dateFormatter = DateFormatter()
		
		dateFormatter.dateFormat = defaultDateFormat
		dateFormatter.timeZone = .current
				
		decoder.dateDecodingStrategy = .formatted(dateFormatter)
	}
	
	func decode<T>(_ type: T.Type, from data: Data) -> Optional<T> where T : Decodable {
		return try! decoder.decode(type, from: data)
	}
}
