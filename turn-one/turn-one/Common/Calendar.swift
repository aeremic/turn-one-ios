//
//  Calendar.swift
//  turn-one
//
//  Created by Andrija Eremić on 15.10.24..
//

import Foundation

extension Calendar {
	static func addOrSubtractDay(date: Date, day: Int) -> Date{
		return Calendar.current.date(byAdding: .day, value: day, to: date)!
	}
	
	static func addOrSubtractHour(date: Date, hour: Int) -> Date{
		return Calendar.current.date(byAdding: .hour, value: hour, to: date)!
	}
}
