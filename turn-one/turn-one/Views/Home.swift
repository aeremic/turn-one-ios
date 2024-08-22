//
//  Home.swift
//  turn-one
//
//  Created by Andrija Eremić on 19.8.24..
//

import Foundation
import SwiftUI
import PopupView

struct Home: View {
	@StateObject private var raceDataProvider = RaceDataProvider()
	
	@State var shouldShowDetails = false
	@State var selectedRaceForShowDetails: Race? = nil
	
	func onShowDetailsClick (selectedRace: Race) {
		selectedRaceForShowDetails = selectedRace
		shouldShowDetails = true
	}
	
	func fetchRaces() {
		try! raceDataProvider.fetchRaces()
	}
	
	var body: some View {
		ZStack {
			VStack {
				Spacer()
				Image(systemName: "car.2.fill")
					.resizable()
					.foregroundColor(.blue)
					.frame(width: 160, height: 100)
					.padding()
				Text("World Endurance Championship Races")
					.font(.title)
					.fontWeight(.semibold)
					.foregroundStyle(.blue)
					.padding(.bottom)
				List {
					ForEach(raceDataProvider.races) { race in
						HStack {
							Text(String(race.title))
							Spacer()
							Text("29 Feb 12:30")
								.padding(8)
								.foregroundColor(.blue)
								.background(.white)
								.font(.body)
								.overlay(
									RoundedRectangle(cornerRadius: 10)
										.stroke(.blue, lineWidth: 1)
								)
						}
						.contentShape(Rectangle())
						.onTapGesture {
							onShowDetailsClick(selectedRace: race)
						}
					}
				}
				.scrollContentBackground(.hidden)
				.onAppear(){
					fetchRaces()
				}
				Spacer()
			}
		}.popup(isPresented: $shouldShowDetails){
			Text(String(shouldShowDetails))
			RaceDetails(race: $selectedRaceForShowDetails)
		} customize: {
			$0
				.type (.toast)
				.position(.bottom)
				.dragToDismiss(true)
		}
	}
}


#Preview {
	Home()
}
