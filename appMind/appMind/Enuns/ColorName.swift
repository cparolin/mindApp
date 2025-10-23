//
//  ColorName.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI

enum ColorName: String, CaseIterable {
    case blue
    case red
    case yellow
    case orange
    case purple
    case gray
    case green

    var color: Color {
        switch self {
        case .blue:
            return .blue
        case .red:
            return .red
        case .yellow:
            return .yellow
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .gray:
            return .gray
        case .green:
            return .green
        }
    }

    static func from(name: String) -> Color {
        let color: String
        
        switch name {
        case "amarelo":
            color = "yellow"
        case "laranja":
            color = "orange"
        case "azul":
            color = "blue"
        case "vermelho":
            color = "red"
        case "roxo":
            color = "purple"
        case "verde":
            color = "green"
        case "cinza":
            color = "gray"
        default:
            color = name
        }

        if let colorName = ColorName(rawValue: color) {
            return colorName.color
        } else {
            return .gray 
        }
    }
}
