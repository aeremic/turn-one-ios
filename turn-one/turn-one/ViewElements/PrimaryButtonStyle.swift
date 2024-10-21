//
//  PrimaryButtonStyle.swift
//  turn-one
//
//  Created by Andrija Eremić on 21.10.24..
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
	
	var backgroundColor: Color = .blue
	var textColor: Color = Color.white
	var height: CGFloat = 46
	var cornerRadius: CGFloat = 10
	var fontSize: CGFloat = 15
	var disabled: Bool = false
	var textSidePadding: CGFloat = 30
	var weight: Font.Weight = .bold
	var maxWidth: CGFloat = 300
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding([.leading, .trailing], textSidePadding)
			.frame(maxWidth: maxWidth, maxHeight: height)
			.background(disabled ? .gray : backgroundColor)
			.foregroundColor(textColor)
			.cornerRadius(cornerRadius)
			.font(.system(size: fontSize, weight: weight, design: .default))
//			.scaleEffect(configuration.isPressed ? 1.2 : 1)
//			.animation(.easeOut(duration: 0.2), value: configuration.isPressed)
	}
}
