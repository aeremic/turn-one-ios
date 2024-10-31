//
//  turn_oneApp.swift
//  turn-one
//
//  Created by Andrija Eremić on 19.8.24..
//

import SwiftUI

@main
struct turn_oneApp: App {
	@ObservedObject var router = Router()

    var body: some Scene {
        WindowGroup {
			NavigationStack(path: $router.navPath) {
				Home()
				.navigationDestination(for: Router.Destination.self) { dest in
					switch dest {
					case .races(let championshipId):
						Races(championshipId: championshipId)
					case .aboutUs:
						AboutUs()
					}
				}
			}
			.environmentObject(router)
        }
    }
}
