//
//  SettingsModel.swift
//  appMind
//
//  Created by Camila Parolin on 16/10/25.
//

import Foundation

var Palettes = [
    "Saturadas" : [ "cor1" : "saturadas1",
                    "cor1.1" : "saturadas1.1",
                    "cor1.2" : "saturadas1.2",
                    "cor2" : "saturadas2",
                    "cor2.1" : "saturadas2.1",
                    "cor2.2" : "saturadas2.2",
                    "cor3" : "saturadas3",
                    "cor4" : "saturadas4",
                    "cor4.1" : "saturadas4.1",
                    "cor4.2" : "saturadas4.2",
                    "cor5" : "saturadas5",
                    "cor6" : "saturadas6"
    ],
    "Suaves" :    [ "cor1" : "suaves1",
                    "cor1.1" : "suaves1.1",
                    "cor1.2" : "suaves1.2",
                    "cor2" : "suaves2",
                    "cor2.1" : "suaves2.1",
                    "cor2.2" : "suaves2.2",
                    "cor3" : "suaves3",
                    "cor4" : "suaves4",
                    "cor4.1" : "suaves4.1",
                    "cor4.2" : "suaves4.2",
                    "cor5" : "suaves5",
                    "cor6" : "suaves6"
    ],
    "Tons Frios" : [ "cor1" : "frios1",
                     "cor1.1" : "frios1.1",
                     "cor1.2" : "frios1.2",
                     "cor2" : "frios2",
                     "cor2.1" : "frios2.1",
                     "cor2.2" : "frios2.2",
                     "cor3" : "frios3",
                     "cor4" : "frios4",
                     "cor4.1" : "frios4.1",
                     "cor4.2" : "frios4.2",
                     "cor5" : "frios5",
                     "cor6" : "frios6"
    ],
    "Tons de Cinza" : [ "cor1" : "cinza1",
                        "cor1.1" : "cinza1.1",
                        "cor1.2" : "cinza1.2",
                        "cor2" : "cinza2",
                        "cor2.1" : "cinza2.1",
                        "cor2.2" : "cinza2.2",
                        "cor3" : "cinza3",
                        "cor4" : "cinza4",
                        "cor4.1" : "cinza4.1",
                        "cor4.2" : "cinza4.2",
                        "cor5" : "cinza5",
                        "cor6" : "cinza6"
    ]
]

var PalettesButton = [
    "Saturadas" : [ "cor1" : "saturadas1",
                    "cor2" : "saturadas2",
                    "cor3" : "saturadas3",
                    "cor4" : "saturadas4",
                    "cor5" : "saturadas5",
                    "cor6" : "saturadas6"
    ],
    "Suaves" :    [ "cor1" : "suaves1",
                    "cor2" : "suaves2",
                    "cor3" : "suaves3",
                    "cor4" : "suaves4",
                    "cor5" : "suaves5",
                    "cor6" : "suaves6"
    ],
    "Tons Frios" : [ "cor1" : "frios1",
                     "cor2" : "frios2",
                     "cor3" : "frios3",
                     "cor4" : "frios4",
                     "cor5" : "frios5",
                     "cor6" : "frios6"
    ],
    "Tons de Cinza" : [ "cor1" : "cinza1",
                        "cor2" : "cinza2",
                        "cor3" : "cinza3",
                        "cor4" : "cinza4",
                        "cor5" : "cinza5",
                        "cor6" : "cinza6"
    ]
]


public func getPaletteColor(palette: String, color: String) -> String {
    return Palettes[palette]?[color] ?? "azul"
}

public func getPaletteColorButton(palette: String, color: String) -> String {
    return PalettesButton[palette]?[color] ?? "azul"
}
