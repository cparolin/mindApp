//
//  ThirdView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI
import PhotosUI

/// Esta View é onde o usuario indica seu nome e foto de perfil, contendo a opção de iniciar sem criar um perfil(sem armazenar nome nem icone de perfil).

struct ThirdView: View {
    @State var userProfileNameTemp: String = ""
    @State var imageSelection: PhotosPickerItem? = nil
    @State var userProfileImage: UIImage = UIImage()
    @AppStorage("Imagem do usuario salvo localmente") var savedUserProfileImage: Data = Data()
    @AppStorage("Nome do usuario salvo localmente") var userName: String = ""
    @Environment(AppState.self) private var appState: AppState
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    var temp: Bool = true
    var body: some View {
        VStack{
            Text("Crie seu perfil")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom , 30)
                .accessibilityLabel(Text("Crie seu perfil"))
            
            
            PhotosPicker(selection: $imageSelection, matching: .images){
                if imageSelection == nil{
                    Circle()
                        .foregroundStyle(Color.gray)
                        .frame(width: 161)
                }
                else {
                    Image(uiImage: userProfileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 161 , height: 161)
                        .clipShape(Circle())
                }
            }
            .accessibilityLabel(Text("Botão para seleção da foto de perfil"))
            
            .padding(.bottom  , 20)
            VStack(alignment: .center){
                TextField("AAAAAAAAAAA", text: $userProfileNameTemp, prompt: Text("Nome e Sobrenome")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray))
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.bottom , 80)
                .accessibilityLabel(Text("Campo para escrever o nome de usuário"))
            }
            Button(){
                if  userProfileNameTemp == ""{
                    userName = " "
                }
                userName = userProfileNameTemp
                appState.setFirstTimeOnApp(value: true)
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 314 , height: 41 , alignment: .center)
                        .foregroundStyle(Color.blue)
                    
                    Text("Iniciar")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
            }
            .accessibilityLabel(Text("Botão para salvar o perfil e prosseguir para página principal do aplicativo"))
            
            Button(){
                imageSelection = nil
                savedUserProfileImage = Data()
                appState.setFirstTimeOnApp(value: true)
            } label: {
                Text("Iniciar sem criar perfil")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
            .foregroundStyle(colorScheme == .light ? .black : .white)
            .padding(.top , 10)
            .accessibilityLabel(Text("Botão para entrar no aplicativo sem fazer um perfil"))
        }
        .task(id: imageSelection) {
            do{
                if let loaded = try await imageSelection?.loadTransferable(type: Data.self) {
                    savedUserProfileImage = loaded
                    userProfileImage = UIImage(data: savedUserProfileImage) ?? UIImage(named: "Se Voce esta vendo isso, significa que algo deu errado no momento de converter o Data para UIImage na 'ThirdView'")!
                } else {
                    print("Failed")
                }
            } catch(let error) {
                print(error.localizedDescription)
            }
        }
        .vSpacing(.top)
        .padding(.top , 25)
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
    ThirdView()
}
