//
//  RaceDetails.swift
//  turn-one
//
//  Created by Andrija Eremić on 20.8.24..
//

import Foundation
import SwiftUI

struct RaceDetails : View {
//	@State private var schedules = [
//		Schedule(name: "Free Practice 1", date: "29 Feb 12:30"),
//		Schedule(name: "Free Practice 2", date: "29 Feb 12:30"),
//		Schedule(name: "Free Practice 3", date: "29 Feb 12:30"),
//		Schedule(name: "Qualifying - LMGT3", date: "29 Feb 12:30"),
//		Schedule(name: "Hyperpole - LMGT3", date: "29 Feb 12:30"),
//		Schedule(name: "Qualifying - HY", date: "29 Feb 12:30"),
//		Schedule(name: "Hyperpole - HY", date: "29 Feb 12:30"),
//		Schedule(name: "Race", date: "29 Feb 12:30")
//	]
	
	var body : some View {
		ZStack {
			VStack {
				VStack(spacing: 16) {
					Color.black
						.opacity(0.3)
						.frame(width: 70, height: 6)
						.clipShape(Capsule())
						.padding(.top, 15)
					VStack(alignment: .leading) {
						Text("Qatar 1812km Details")
							.font(.title)
							.foregroundStyle(.blue)
							.padding(.bottom)
						
//						ForEach(schedules) { schedule in
//							HStack {
//								/*@START_MENU_TOKEN@*/Text(schedule.name)/*@END_MENU_TOKEN@*/
//									.font(.body)
//								Spacer()
//								Text(schedule.date)
//									.padding(8)
//									.border(.blue)
//									.foregroundColor(.white)
//									.background(.blue)
//									.cornerRadius(10)
//									.font(.body)
//							}
//							.padding(.bottom)
//						}
					}
					.frame(
						minWidth: 0,
						maxWidth: .infinity
					)
					// Spacer() // uncomment for full screen popup
				}
				.padding(.horizontal, 24)
				.padding(.vertical, 16)
				.background(.white)
				.cornerRadius(10)
				.shadow(radius: 20)
			}
		}
	}
}

#Preview {
	RaceDetails()
}
