//
//  HomeScreenView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI

///Tela inicial e base para o 
struct HomeScreenView: View {
    @Environment(AppState.self) private var appState: AppState
    @Environment(\.colorScheme) var colorScheme
    
    var colorMode: Bool {
        if colorScheme == .light {
            return true
        } else { return false }
    }
    
    var body: some View {
        VStack (spacing: 50){
            Image(colorMode ? "icon.light" : "icon.dark")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.23, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .accessibilityLabel(Text("Imagem do ícone do aplicativo"))
                .accessibilityHint(Text("Imagem de uma pasta azul piscina em efeito de vidro com um símbolo de check"))
                
            VStack {
                Text("Bem-vindo ao Conscist!")
                    .font(.title)
                    .fontWeight(.bold)
                    .accessibilityLabel(Text("Bem-vindo ao Conscist!"))
                
                Text("Um aplicativo de organização e reflexão")
                    .accessibilityLabel(Text("Um aplicativo de organização e reflexão"))
                    .font(.body)
                    .fontWeight(.regular)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.08)
            }
            
            Button{
                appState.route = .firstScreen
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 42, alignment: .center)
                        .foregroundStyle(Color.blue)
                    Text("Iniciar")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
            }
            .accessibilityLabel(Text("Botão para avançar para a próxima parte da introducão do aplicativo"))
        }
    }
}

#Preview {
    HomeScreenView()
}
