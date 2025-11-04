//
//  SettingsView.swift
//  appMind
//
//  Created by Camila Parolin on 27/10/25.
//
import PhotosUI
import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("Imagem do usuario salvo localmente") var savedUserProfileImage: Data = Data()
    @AppStorage("Nome do usuario salvo localmente") var userName: String = ""
    
    @State var presentConfirmation: Bool = false
    @State var userProfileNameTemp: String = ""
    @State var imageSelection: PhotosPickerItem? = nil
    @State var userProfileImage: UIImage = UIImage()

    var body: some View {
        NavigationStack {
            NavigationView {
                VStack {
                    if let uiImage = UIImage(data: savedUserProfileImage) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 161 , height: 161)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "questionmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 161 , height: 161)
                            .clipShape(Circle())
                            .onTapGesture {
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
                            }
                    }
                    if userName != "" {
                        Text("\(userName)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 21)
                            .padding(.bottom, 45)
                    } else {
                        Text("Sem nome de usuário")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 21)
                            .padding(.bottom, 45)
                    }
                    HStack {
                        NavigationLink(destination: NotificationsView()) {
                            HStack {
                                Image(systemName: "bell.badge")
                                Text("Notificações")
                            }
                            .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .padding(.vertical, 11)
                    }
                    Divider()
                    NavigationLink(destination: AppearenceView()) {
                        HStack {
                            Image(systemName: "paintpalette")
                            Text("Aparência")
                        }
                        .foregroundStyle(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 11)
                    Spacer()
                    Button(role: .destructive){
                        presentConfirmation.toggle()
                    } label: {
                        Text("Excluir dados")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .hSpacing(.center)
                    }
                    .confirmationDialog("Você tem certeza que deseja excluir esse evento?", isPresented: $presentConfirmation , titleVisibility: .visible){
                        Button("Sim" , role: .destructive){
                            savedUserProfileImage = Data()
                            userName = ""
                            dismiss()
                        }
                    }

                    
                }
                .padding(16)
                .navigationTitle("Ajustes")
            }
            
        }
        
    }
}

#Preview {
    SettingsView()
}
