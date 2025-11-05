//
//  SettingsView.swift
//  appMind
//
//  Created by Camila Parolin on 27/10/25.
//
import PhotosUI
import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("Imagem do usuario salvo localmente") var savedUserProfileImage: Data = Data()
    @AppStorage("Nome do usuario salvo localmente") var userName: String = ""
    
    @State var presentConfirmation: Bool = false
    @State var userProfileNameTemp: String = ""
    @State var imageSelection: PhotosPickerItem? = nil
    @State var userProfileImage: UIImage = UIImage()
    @State var nomeUsuario: String = ""
    var questionMark: Image = Image(systemName: "questionmark")
    
    var body: some View {
        NavigationStack {
            NavigationView {
                VStack (alignment: .center){
                    if let uiImage = UIImage(data: savedUserProfileImage) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 161 , height: 161)
                            .clipShape(Circle())
                    } else {
                        PhotosPicker(selection: $imageSelection, matching: .images){
                            if UIImage(data: savedUserProfileImage) == nil{
                                Circle()
                                    .foregroundStyle(Color.gray)
                                    .frame(width: 161)
                            }
                        }
                    }
                    if userName == "" {
                        TextField("Sem nome de usuário", text: $nomeUsuario)
                            .font(.title2)
                            .bold()
                            .padding(.top, 21)
                            .padding(.bottom, 45)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .onSubmit {
                                userName = nomeUsuario
                            }
                    } else {
                        Text("\(userName)")
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
                    .confirmationDialog("Você tem certeza que deseja excluir TODOS os seus dados? Isso também irá deletar todas as suas tarefas e diários", isPresented: $presentConfirmation , titleVisibility: .visible){
                        Button("Sim" , role: .destructive){
                            savedUserProfileImage = Data()
                            userName = ""
                            nomeUsuario = ""
                            do {
                                try context.delete(model: Task.self)
                                try context.delete(model: TaskDay.self)
                                try context.delete(model: JournalModel.self)
                                try context.delete(model: JournalTypeModel.self)
                            } catch {
                                print("Falha ao deletar Modelo: \(error)")
                            }
                            dismiss()
                        }
                    }
                }
                .padding(16)
                .navigationTitle("Ajustes")
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
            }
        }
    }
}

#Preview {
    SettingsView()
}
