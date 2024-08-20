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
//	let mockedList = [
//		"Qatar 1812km",
//		"6 Hours of Imola",
//		"6h of Spa-Francorchamps",
//		"24h of Le Mans"]
	
	@State var shouldShowDetails = false
	@State private var selectedItem: Race? = nil
	
	func onShowDetailsClick (selectedItem: Race) {
		self.selectedItem = selectedItem
		self.shouldShowDetails = true
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
					ForEach(raceDataProvider.races) { item in
						HStack {
							Text(String(item.title))
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
							onShowDetailsClick(selectedItem: item)
						}
					}
				}
				.scrollContentBackground(.hidden)
				.onAppear(){
					raceDataProvider.fetchRaces()
				}
				Spacer()
			}
		}.popup(isPresented: $shouldShowDetails){
			RaceDetails()
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
