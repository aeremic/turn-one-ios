//
//  Home.swift
//  turn-one
//
//  Created by Andrija Eremić on 21.10.24..
//

import Foundation
import SwiftUI

struct Home : View {
	@EnvironmentObject var router: Router
	
	func onGoToWECClick() {
		router.navigate(to: .wec)
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
				Button(action: {}) {
					Text("Formula 1")
				}
				.buttonStyle(PrimaryButtonStyle(maxWidth: 300))
				Button(action: {self.onGoToWECClick()}) {
					Text("World Endurance Championship")
				}
				.buttonStyle(PrimaryButtonStyle(maxWidth: 300))
				Button(action: {}) {
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
