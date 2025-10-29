//
//  InnerShadow.swift
//  appMind
//
//  Created by Dayô Araújo on 23/10/25.
//
import SwiftUI
import Foundation

extension Text {
    func innerShadow<V: View>(_ background: V, radius: CGFloat = 4, opacity: Double = 0.6) -> some View {
        self
            .foregroundColor(.clear)
            .overlay(background.mask(self))
            .overlay(
                ZStack {
                    self.foregroundColor(Color(white: 0.9 - opacity))
                    self.foregroundColor(.white).blur(radius: radius).offset(x: 5, y: 5)
                }
                    .mask(self)
                    .blendMode(.multiply)
            )
    }
}
