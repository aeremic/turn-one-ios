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
}
