//
//  HomeScreenView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI

/// Esta View é uma prevea visual e breve descrição de como funciona sistema de Diarios do app.
struct SecondView: View {
    @Environment(AppState.self) private var appState: AppState
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var colorMode: Bool {
        if colorScheme == .light {
            return true
        } else { return false }
    }
    
    var body: some View{
        VStack{
            Text("Diário")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom , 5)
            
            Text("Aqui você escreve sobre seu dia a dia, vícios e dificuldades de comunicação, com perguntas feitas com base em aplicações da técnica do Registro de Pensamentos Disfuncionais (RPD).")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 2){
                Image(colorMode ? "routine.light" : "")
                    .resizable()
                    .frame(width: 120 , height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                Image(colorMode ? "social.light" : "")
                    .resizable()
                    .frame(width: 120 , height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Image(colorMode ? "addiction.light" : "")
                    .resizable()
                    .frame(width: 120 , height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.top , 36)
            Button(){
                appState.route = .thirdScreen
            } label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 314 , height: 41 , alignment: .center)
                        .foregroundStyle(Color.blue)
                    Text("Avançar")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.top , 70)
            }
            Button(){
                appState.setFirstTimeOnApp(value: true)
            } label: {
                    Text("Pular introdução")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                        .fontWeight(.semibold)
            }
            .padding(.top , 5)
        }
        .vSpacing(.top)
        .padding(.top , 60)
        .toolbar(){
            ToolbarItem(placement: .topBarLeading){
                Button(){
                    appState.route = .homeScreen
                } label:{
                    HStack(spacing: 4){
                        Image(systemName: "chevron.left")
                        Text("Inicio")
                    }
                    .padding(.top , 16)
                }
            }
        }
    }
}


#Preview {
    SecondView()
}
