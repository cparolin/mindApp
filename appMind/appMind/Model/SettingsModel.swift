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
                    "cor1.1" : "azul",
                    "cor1.2" : "azul",
                    "cor2" : "vermelho",
                    "cor2.1" : "vermelho",
                    "cor2.2" : "vermelho",
                    "cor3" : "roxo",
                    "cor4" : "verde",
                    "cor4.1" : "verde",
                    "cor4.2" : "verde",
                    "cor5" : "amarelo",
                    "cor6" : "rosa"
    ],
    "Suaves" :    [ "cor1" : "amarelo",
                    "cor1.1" : "amarelo",
                    "cor1.2" : "amarelo",
                    "cor2" : "rosa",
                    "cor2.1" : "vermelho",
                    "cor2.2" : "vermelho",
                    "cor3" : "laranja",
                    "cor4" : "azul",
                    "cor4.1" : "verde",
                    "cor4.2" : "verde",
                    "cor5" : "roxo",
                    "cor6" : "verde"
    ],
    "Tons Frios" : [ "cor1" : "verde",
                     "cor1.1" : "amarelo",
                     "cor1.2" : "amarelo",
                     "cor2" : "roxo",
                     "cor2.1" : "vermelho",
                     "cor2.2" : "vermelho",
                     "cor3" : "azul",
                     "cor4" : "rosa",
                     "cor4.1" : "verde",
                     "cor4.2" : "verde",
                     "cor5" : "vermelho",
                     "cor6" : "amarelo"
    ],
    "Tons de Cinza" : [ "cor1" : "laranja",
                        "cor1.1" : "amarelo",
                        "cor1.2" : "amarelo",
                        "cor2" : "vermelho",
                        "cor2.1" : "vermelho",
                        "cor2.2" : "vermelho",
                        "cor3" : "roxo",
                        "cor4" : "amarelo",
                        "cor4.1" : "verde",
                        "cor4.2" : "verde",
                        "cor5" : "rosa",
                        "cor6" : "azul"
    ]
]

var PalettesButton = [
    "Saturadas" : [ "cor1" : "azul",
                    "cor2" : "vermelho",
                    "cor3" : "roxo",
                    "cor4" : "verde",
                    "cor5" : "amarelo",
                    "cor6" : "rosa"
    ],
    "Suaves" :    [ "cor1" : "amarelo",
                    "cor2" : "rosa",
                    "cor3" : "laranja",
                    "cor4" : "azul",
                    "cor5" : "roxo",
                    "cor6" : "verde"
    ],
    "Tons Frios" : [ "cor1" : "verde",
                     "cor2" : "roxo",
                     "cor3" : "azul",
                     "cor4" : "rosa",
                     "cor5" : "vermelho",
                     "cor6" : "amarelo"
    ],
    "Tons de Cinza" : [ "cor1" : "laranja",
                        "cor2" : "vermelho",
                        "cor3" : "roxo",
                        "cor4" : "amarelo",
                        "cor5" : "rosa",
                        "cor6" : "azul"
    ]
]


public func getPaletteColor(palette: String, color: String) -> String {
    return Palettes[palette]?[color] ?? "azul"
}

public func getPaletteColorButton(palette: String, color: String) -> String {
    return PalettesButton[palette]?[color] ?? "azul"
}
