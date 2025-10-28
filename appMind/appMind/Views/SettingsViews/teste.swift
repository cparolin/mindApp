//
//  teste.swift
//  appMind
//
//  Created by Camila Parolin on 28/10/25.
//

import SwiftUI

struct TesteView: View {
    var body: some View {
        Button {
            print(Palettes["Palette1"]!["cor1"]!)
        } label: {
            Text("Clique aqui")
        }
    }
}

#Preview {
    TesteView()
}
