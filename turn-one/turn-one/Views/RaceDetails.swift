//
//  RaceDetails.swift
//  turn-one
//
//  Created by Andrija Eremić on 20.8.24..
//

import Foundation
import SwiftUI

struct RaceDetails : View {
	@Binding var race: Race?
	
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
						Text(race!.title)
							.font(.title)
							.foregroundStyle(.blue)
							.padding(.bottom)
						
						ForEach(race!.schedules) { schedule in
							HStack {
								Text(schedule.title)
									.font(.body)
								Spacer()
								if schedule.isLive() {
									Text(schedule.date,
										 format: .dateTime.day().month().hour().minute())
									.padding(8)
									.border(.red)
									.foregroundColor(.white)
									.background(.red)
									.cornerRadius(10)
									.font(.body)
								} else {
									if schedule.isFinished() {
										Text(schedule.date,
											 format: .dateTime.day().month().hour().minute())
										.padding(8)
										.border(.gray)
										.foregroundColor(.white)
										.background(.gray)
										.cornerRadius(10)
										.font(.body)
									} else {
										Text(schedule.date,
											 format: .dateTime.day().month().hour().minute())
										.padding(8)
										.border(.blue)
										.foregroundColor(.white)
										.background(.blue)
										.cornerRadius(10)
										.font(.body)
									}
								}
							}
							.padding(.bottom)
						}
					}
					.frame(
						minWidth: 0,
						maxWidth: .infinity
					)
					Spacer() // uncomment for full screen popup
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
