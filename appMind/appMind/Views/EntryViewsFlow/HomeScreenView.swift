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
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200 , height: 200 , alignment: .top)
            Text("Bem-vindo ao App!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Um aplicativo de organização e reflexão")
                .font(.body)
                .fontWeight(.regular)
                .padding(.bottom, 80)
            Button{
                appState.route = .firstScreen
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 314 , height: 42 , alignment: .center)
                        .foregroundStyle(Color.blue)
                    Text("Iniciar")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                .padding(.top , 24)
            }
        }
    }
}


//#Preview {
//    HomeScreenView()
//}
