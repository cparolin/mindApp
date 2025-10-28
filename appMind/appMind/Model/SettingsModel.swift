//
//  SettingsModel.swift
//  appMind
//
//  Created by Camila Parolin on 16/10/25.
//

import Foundation

enum ColorCases: String, CaseIterable {
    case azul
    case vermelho
    case roxo
    case verde
    case amarelo
    case rosa
    case laranja
}

var Palettes = [
    "Saturadas" : [ "cor1" : "azul",
                   "cor2" : "vermelho",
                   "cor3" : "roxo",
                   "cor4" : "verde"
    ],
    "Suaves" : [ "cor1" : "amarelo",
                   "cor2" : "rosa",
                   "cor3" : "laranja",
                   "cor4" : "azul"
    ],
    "Tons Frios" : [ "cor1" : "verde",
                   "cor2" : "roxo",
                   "cor3" : "azul",
                   "cor4" : "rosa"
    ],
    "Tons de Cinza" : [ "cor1" : "laranja",
                   "cor2" : "vermelho",
                   "cor3" : "roxo",
                   "cor4" : "amarelo"
    ]
]


public func getPaletteColor(palette: String, color: String) -> String {
    return Palettes[palette]?[color] ?? "azul"
}
