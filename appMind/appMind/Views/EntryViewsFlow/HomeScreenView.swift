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
                
            VStack {
                Text("Bem-vindo ao Conscist!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Um aplicativo de organização e reflexão")
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
        }
    }
}

#Preview {
    HomeScreenView()
}
