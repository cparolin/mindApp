//
//  ThirdView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI

struct ThirdView: View {
    @State var nomeUsuario: String = ""
    @Environment(AppState.self) private var appState: AppState
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack{
            Text("Crie seu perfil")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom , 30)
            
            Circle()
                .frame(width: 161)
                .foregroundStyle(Color.gray)
                .padding(.bottom , 25)
            VStack(alignment: .center){
                TextField("AAAAAAAAAAA", text: $nomeUsuario, prompt: Text("Nome e Sobrenome")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray))
                .multilineTextAlignment(.center)
                .padding(.bottom , 80)
            }
            
            Button(){
                appState.route = .secondScreen
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 314 , height: 41 , alignment: .center)
                        .foregroundStyle(Color.blue)
                    
                    Text("Iniciar")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }        }
            
            Button(){
                dismiss()
            } label: {
                Text("Iniciar sem criar perfil")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(colorScheme == .light ? .black : .white)
            .padding(.top , 10)
        }
        .vSpacing(.top)
        .padding(.top , 25)
    }
}

#Preview {
    ThirdView()
}
