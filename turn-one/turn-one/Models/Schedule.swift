//
//  Schedule.swift
//  turn-one
//
//  Created by Andrija Eremić on 20.8.24..
//

import Foundation

struct Schedule: Codable, Identifiable {
	let id: Int?
	
	let title: String
	let date: Date
	
	func isLive() -> Bool {
		self.date < Date.now && Calendar.addOrSubtractHour(date: self.date, hour: 1) >= Date.now
	}
	
	func isFinished() -> Bool {
		self.date < Date.now
	}
}
