//
//  SecondaryButtonStyle.swift
//  turn-one
//
//  Created by Andrija Eremić on 21.10.24..
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
	
	var backgroundColor: Color = .white
	var textColor: Color = .blue
	var height: CGFloat = 46
	var cornerRadius: CGFloat = 10
	var fontSize: CGFloat = 15
	var disabled: Bool = false
	var textSidePadding: CGFloat = 30
	var weight: Font.Weight = .bold
	var maxWidth: CGFloat = 300
	var borderLineWidth: CGFloat = 1
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding([.leading, .trailing], textSidePadding)
			.frame(maxWidth: maxWidth, maxHeight: height)
			.foregroundColor(textColor)
			.background(
				RoundedRectangle(cornerRadius: cornerRadius)
					.stroke(.blue, lineWidth: borderLineWidth)
			)			.font(.system(size: fontSize, weight: weight, design: .default))
//			.scaleEffect(configuration.isPressed ? 1.2 : 1)
//			.animation(.easeOut(duration: 0.2), value: configuration.isPressed)
	}
}
