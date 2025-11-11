import SwiftUI
import AudioToolbox
import UIKit

struct AppearenceView: View {
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    @AppStorage("textLayout") private var textLayout: Int = 0
    @AppStorage("sound") private var sound = true
    @AppStorage("tactile") private var tactile = true
    @AppStorage("font") private var font = "SF Pro"
    
    @State private var name: String = "Tim"
    @State private var birthDate = Date.now
    @State private var showingSheet = false
    
    let availableFonts = ["System", "OpenDyslexicMono-Regular.otf"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LayoutRectangle()
                HStack {
                    Text("Paleta de Cores")
                        .font(.changeFont(fontType: font, fontStyle: .title2, fontWeight: .bold))
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        PaletteOptionsButtonView(palette: paletteLayout)
                    }
                    .sheet(isPresented: $showingSheet) {
                        PaletteOptionsView()
                            .presentationDetents([.height(450)])
                            .background(.white)
                    }
                }
                
                HStack {
                    Text("Tipo de Layout")
                        .font(.changeFont(fontType: font, fontStyle: .title2, fontWeight: .bold))
                        .bold()
                    
                    Spacer()
                }
                .padding()
                
                Picker("", selection: $textLayout) {
                    Text("Completo").tag(0)
                    Text("Simplificado").tag(1)
                    Text("Mínimo").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: UIScreen.main.bounds.width * 0.93)
                
                HStack {
                    Text("Fonte")
                        .font(.changeFont(fontType: font, fontStyle: .title2, fontWeight: .bold))
                        .bold()
                    
                    Spacer()
                    
                    Picker("", selection: $font) {
                        Text("SF Pro")
                            .tag("System")
                        
                        Text("OpenDyslexic")
                            .tag("OpenDyslexic")
                    }
                }
                .padding()
            }
            .navigationTitle("Aparência")
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .onChange(of: font) { oldValue, newValue in
            currentFont(to: font)
        }
    }
}

#Preview {
    AppearenceView()
}
