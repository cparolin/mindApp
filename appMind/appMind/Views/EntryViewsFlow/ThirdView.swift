//
//  ThirdView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI
import PhotosUI

struct ThirdView: View {
    @State var userProfileNameTemp: String = ""
    @State var imageSelection: PhotosPickerItem? = nil
    @State var userProfileImage: Image = Image("Error")
    @AppStorage ("Nome do usuario salvo localmente") var userName: String = " "
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
            
            
            PhotosPicker(selection: $imageSelection, matching: .images){
                if imageSelection == nil{
                    Circle()
                        .frame(width: 161)
                        .foregroundStyle(Color.gray)
                        .padding(.bottom , 25)
                }
                else {
                    userProfileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 161 , height: 161)
                        .clipShape(Circle())
                }
            }
            VStack(alignment: .center){
                TextField("AAAAAAAAAAA", text: $userProfileNameTemp, prompt: Text("Nome e Sobrenome")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray))
                .multilineTextAlignment(.center)
                .padding(.bottom , 80)
            }
            
            Button(){
                if  userProfileNameTemp == "" {
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
            
            Button(){
                appState.setFirstTimeOnApp(value: true)
            } label: {
                Text("Iniciar sem criar perfil")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(colorScheme == .light ? .black : .white)
            .padding(.top , 10)
        }
        .task(id: imageSelection) {
            do{
                if let loaded = try await imageSelection?.loadTransferable(type: Image.self) {
                    userProfileImage = loaded
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
