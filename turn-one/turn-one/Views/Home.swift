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
				Image("logo")
					.resizable()
					.frame(width: 100, height: 100)
					.padding()
				Text("World Endurance Championship Races")
					.font(.title)
					.fontWeight(.semibold)
					.foregroundStyle(.blue)
					.padding(.bottom)
				
				if !raceDataProvider.isLoading {
					List {
						ForEach(raceDataProvider.races) { race in
							HStack {
								Text(String(race.title))
								Spacer()
								if race.isLive() {
									Text(race.date, format: .dateTime.day().month())
										.padding(8)
										.foregroundColor(.white)
										.background(.red)
										.cornerRadius(10)
										.font(.body)
								} else {
									Text(race.date, format: .dateTime.day().month())
										.padding(8)
										.foregroundColor(race.isFinished() ? .gray : .blue)
										.background(.white)
										.font(.body)
										.overlay(
											RoundedRectangle(cornerRadius: 10)
												.stroke(race.isFinished() ? .gray : .blue, lineWidth: 1)
										)
									
								}
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
				} else {
					Spacer()
					SpinnerView()
					Spacer()
				}
				Spacer()
			}
		}.popup(isPresented: $shouldShowDetails){
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
