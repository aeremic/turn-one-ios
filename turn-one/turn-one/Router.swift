//
//  Router.swift
//  turn-one
//
//  Created by Andrija Eremić on 21.10.24..
//

import Foundation
import SwiftUI

final class Router : ObservableObject {
	@Published var navPath = NavigationPath()
	
	public enum Destination: Codable, Hashable {
		case races(championshipId: Int)
		case aboutUs
	}
	
	func navigate(to destination: Destination) {
		navPath.append(destination)
	}
	
	func navigateBack() {
		navPath.removeLast()
	}
	
	func navigateToRoot() {
		navPath.removeLast(navPath.count)
	}
}
