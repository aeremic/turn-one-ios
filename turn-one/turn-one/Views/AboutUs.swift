//
//  Home.swift
//  turn-one
//
//  Created by Andrija Eremić on 21.10.24..
//

import Foundation
import SwiftUI

struct AboutUs : View {
	@EnvironmentObject var router: Router

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
				Text("Turn One keeps you on track with schedules for all major motorsports. Currently supports World Endurance Championship.")
					.font(.body)
					.padding()
				Spacer()
			}
		}
	}
}

#Preview {
	AboutUs()
}
