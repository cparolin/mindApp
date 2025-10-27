//
//  HomeScreenView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI

struct FirstView: View {
    @Environment(AppState.self) private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack{
            Text("Calendario")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom , 3)
            Text("Aqui você coloca todas as suas atividades que deverá realizar durante o dia")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.bottom , 64)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 361 , height: 213 , alignment: .center)
                .foregroundStyle(.gray)
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
    FirstView()
}
