//
//  AppearenceView.swift
//  appMind
//
//  Created by Camila Parolin on 16/10/25.
//

import SwiftUI
import AudioToolbox

struct AppearenceView: View {
    
    @AppStorage("colorLayout") private var colorLayout: ColorCases = .amarelo
    @AppStorage("textLayout") private var textLayout: Int = 0
    @AppStorage("sound") private var sound = true
    @AppStorage("tactile") private var tactile = true
    @AppStorage("font") private var font = ""
    
    let availableFonts = ["System", "OpenDyslexicMono-Regular.otf"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                LayoutRectangle()
                
                HStack {
                    Text("Cor Principal")
                        .font(.openDyslexic(fontStyle: .title, fontWeight: .bold))
                        .bold()
                    
                    Spacer()
                }
                .padding()
                
                HStack{
                    ForEach(ColorCases.allCases, id: \.self) { color in
                        Button {
                            colorLayout = color
                        } label: {
                            ZStack{
                                if colorLayout == color {
                                    Circle()
                                    .fill(Color(color.rawValue))
                                    .background(content: {
                                        Circle()
                                            .stroke(.blue, lineWidth: 8)
                                            .stroke(.white, lineWidth: 4)
                                    })
                                    .frame(width: 38)
                                } else {
                                    Circle()
                                    .fill(Color(color.rawValue))
                                    .frame(width: 38)
                                }
                            }
                        }
                    }
                }
                
                ///Text Layout
                HStack {
                    Text("Tipo de Layout")
                        .font(.title)
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
                    Text("Efeitos")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                
//                List {
                
                    Toggle("Som", isOn: $sound)
                    .onChange(of: sound) {
                        AudioServicesPlaySystemSound(1522)
                    }
                    .padding()
                
                Toggle("Tátil", isOn: $tactile)
                .onChange(of: tactile) {
                    AudioServicesPlaySystemSound(1522)
                }
                .padding()
//                }
                
                HStack {
                    Text("Fonte")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    
                    Picker("", selection: $font) {
                        Text("SF Pro")
                            .tag("System")
                        
                        Text("OpenDislexic")
                            .font(.openDyslexic())
                            .tag("OpenDyslexicMono-Regular")
                    }
                }
                .padding()
                
            }
            .navigationTitle("Aparência")
        }
    }
}

#Preview {
    AppearenceView()
}
