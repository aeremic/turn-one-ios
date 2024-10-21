//
//  Home.swift
//  turn-one
//
//  Created by Andrija Eremić on 21.10.24..
//

import Foundation
import SwiftUI

enum GoToType {
	case wecRaces
	case f1Races
	case aboutUs
}

struct Home : View {
	@EnvironmentObject var router: Router
	
	func onGoToClick(type: GoToType) {
		switch(type) {
		case .wecRaces:
			router.navigate(to: .races)
			break
		case .f1Races:
			router.navigate(to: .races)
			break
		case .aboutUs:
			router.navigate(to: .races)
			break;
		}
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
				Button(action: { self.onGoToClick(type: .f1Races) }) {
					Text("Formula 1")
				}
				.buttonStyle(PrimaryButtonStyle(maxWidth: 300))
				Button(action: { self.onGoToClick(type: .wecRaces) }) {
					Text("World Endurance Championship")
				}
				.buttonStyle(PrimaryButtonStyle(maxWidth: 300))
				Button(action: { self.onGoToClick(type: .aboutUs) }) {
					Text("About Us")
				}
				.buttonStyle(SecondaryButtonStyle(maxWidth: 300))
				Spacer()
			}
		}
	}
}

#Preview {
	Home()
}
