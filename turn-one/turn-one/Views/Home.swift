//
//  Home.swift
//  turn-one
//
//  Created by Andrija Eremić on 21.10.24..
//

import Foundation
import SwiftUI

enum GoToType {
	case races
	case aboutUs
}

struct Home : View {
	@EnvironmentObject var router: Router
	
	@StateObject private var championshipDataProvider = ChampionshipDataProvider()
	
	func fetchChampionships() {
		try! championshipDataProvider.fetchChampionships()
	}
	
	func onGoToRaceClick(championshipId: Int, championshipTitle: String) {
		router.navigate(to: .races(championshipId: championshipId,
								   championshipTitle: championshipTitle))
	}
	
	func onGoToClick(type: GoToType) {
		router.navigate(to: .aboutUs)
	}
	
	var body: some View {
		ZStack {
			VStack {
				Spacer()
				HStack {
					Spacer()
					Image("logo")
						.resizable()
						.frame(width: 50, height: 50)
						.padding()
					VStack (alignment: .leading) {
						Text("Turn One")
							.font(.title)
							.fontWeight(.semibold)
							.foregroundStyle(.blue)
						Text("Motosport home")
							.font(.body)
							.foregroundStyle(.blue)
					}
					Spacer()
				}
				if !championshipDataProvider.isLoading {
					VStack {
						ForEach(championshipDataProvider.championships) { championship in
							Button(action: {
								self.onGoToRaceClick(championshipId: championship.id!,
													 championshipTitle: championship.title)
							}) {
								Text(championship.title)
							}
							.buttonStyle(PrimaryButtonStyle(maxWidth: 300))
						}
					}
					Button(action: { self.onGoToClick(type: .aboutUs) }) {
						Text("About")
					}
					.buttonStyle(SecondaryButtonStyle(maxWidth: 300))
				} else {
					Spacer()
					SpinnerView()
					Spacer()
				}
				Spacer()
			}
			.onAppear(){
				fetchChampionships()
			}
		}
	}
}

#Preview {
	Home()
}
