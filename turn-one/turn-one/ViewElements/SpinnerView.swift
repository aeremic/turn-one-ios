//
//  SpinnerView.swift
//  turn-one
//
//  Created by Andrija Eremić on 16.10.24..
//

import SwiftUICore
import SwiftUI

struct SpinnerView: View {
	var body: some View {
		ProgressView()
			.progressViewStyle(CircularProgressViewStyle(tint: .blue))
			.scaleEffect(2.0, anchor: .center)
			.onAppear {
//				DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//						// Simulates a delay in content loading
//						// Perform transition to the next view here
//				}
			}
	}
}

struct ContentView: View {
	var body: some View {
		SpinnerView()
	}
}
