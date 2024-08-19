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
	let mockedList = ["Qatar 1812km", "6 Hours of Imola", "6h of Spa-Francorchamps", "24h of Le Mans"]
	
	@State var shouldShowDetails = false
	@State private var selectedItem: String? = nil
	
	func onShowDetailsClick (selectedItem: String) {
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
				List {
					ForEach(mockedList, id: \.self) { item in
						HStack {
							Text(String(item))
						}
						.contentShape(Rectangle())
						.onTapGesture {
							onShowDetailsClick(selectedItem: item)
						}
					}
					// .onDelete(perform: onDeleteScore)
				}
				.scrollContentBackground(.hidden)
				Spacer()
			}
		}.popup(isPresented: $shouldShowDetails){
			VStack {
				Color.black
					.opacity(0.2)
					.frame(width: 30, height: 6)
					.clipShape(Capsule())
					.padding(.top, 15)
					.padding(.bottom, 10)
				Text("Details")
					.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
					.foregroundColor(.blue)
					.padding(.horizontal, 24)
					.padding(.vertical, 16)
					.background(.white)
					.ignoresSafeArea()
			}
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
