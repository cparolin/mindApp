//
//  HomeScreenView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI

struct SecondView: View {
    @Environment(AppState.self) private var appState: AppState
    @Environment(\.dismiss) private var dismiss
    var body: some View{
        VStack{
            Text("Diário")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom , 5)
            Text("Aqui você escreve sobre seu dia a dia, vícios, dificuldade de comunicação, com perguntas feitas com base em aplicações da técnica do Registro de Pensamentos Disfuncionais RPD.")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text("Além disso você pode criar seu próprio diário com perguntas personalizadas!")
                .foregroundStyle(Color.gray)
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top, 2)
            
            HStack(spacing: 18){
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 104 , height: 143)
                    .foregroundStyle(Color.gray)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 104 , height: 143)
                    .foregroundStyle(Color.gray)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 104 , height: 143)
                    .foregroundStyle(Color.gray)
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
