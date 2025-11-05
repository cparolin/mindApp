//
//  HomeScreenView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI

/// Esta View é uma prevea visual e breve descrição de como funciona o sistema de Calendario do app.
struct FirstView: View {
    @Environment(AppState.self) private var appState: AppState
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var colorMode: Bool {
        if colorScheme == .light {
            return true
        } else { return false }
    }

    var body: some View {
        VStack{
            Text("Calendário")
                .accessibilityLabel(Text("Calendário"))
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom , 3)
            
            Text("Aqui você coloca todas as suas atividades que deverá realizar durante o dia")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.bottom , 64)
                .accessibilityLabel(Text("Texto que indica que a imagem apresentada é o diário onde é possível organizar as tarefas diárias e semanais"))
            
            Image(colorMode ? "calendarLight" : "calendarDark")
                .resizable()
                .frame(width: 361 , height: 213 , alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .accessibilityLabel(Text("Imagem do calendário"))
                .accessibilityHint(Text("Imagem de um calendário com um dia selecionado em azul e três eventos, um em vermelho, um em amarelo e um em azul piscina"))
            
            ///Este botão esta encarregado de redirecionar a tela exibida para a secondScreen.
            Button(){
                appState.route = .secondScreen
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 314 , height: 41 , alignment: .center)
                        .foregroundStyle(Color.blue)
                    Text("Avançar")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                .padding(.top , 72)
            }
            .accessibilityLabel(Text("Botão para avançar para a próxima parte da introdução"))
            
            Button(){
                appState.setFirstTimeOnApp(value: true)
            } label: {
                Text("Pular introdução")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
            }
            .padding(.top , 5)
            .accessibilityLabel(Text("Botão para pular a introdução do aplicativo"))
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
                }
            }
        }
    }
}

#Preview {
    FirstView()
}
