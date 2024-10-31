//
//  Race.swift
//  turn-one
//
//  Created by Andrija Eremić on 20.8.24..
//

import Foundation

struct Race: Codable, Identifiable {
	let id: Int?
	
	let title: String
	let date: Date
		
	let schedules: [Schedule]
	
	let championshipId: Int
	let championship: Championship
	
	func isLive() -> Bool {
		Calendar.addOrSubtractDay(date: self.date, day: -5) <= Date.now
		&& Calendar.addOrSubtractDay(date: self.date, day: 1) > Date.now
	}
	
	func isFinished() -> Bool {
		self.date < Date.now
	}
}
