//
//  AppearenceView.swift
//  appMind
//
//  Created by Camila Parolin on 16/10/25.
//

import SwiftUI

struct AppearenceView: View {
    
    @State private var colorLayout: ColorCases = .amarelo
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width * 0.93, height: 230)
                        .foregroundStyle(.tertiary)
                    VStack{
                        HStack{
                            Spacer()
                                .frame(width: 5)
                            
                            ForEach((1...6), id: \.self) { number in
                                if number == 5 {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: UIScreen.main.bounds.width * 0.10, height: 55)
                                        .foregroundStyle(Color("\(colorLayout)"))
                                        .padding(.trailing, 5)
                                }
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: UIScreen.main.bounds.width * 0.10, height: 55)
                                    .foregroundStyle(.secondary)
                                    .padding(.trailing, 5)
                            }
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: UIScreen.main.bounds.width * 0.89, height: 32)
                                .foregroundStyle(.secondary)
                            
                            HStack {
                                Text("15:00")
                                
                                Rectangle()
                                    .frame(width: 100, height: 5)
                                
                                Spacer()
                                    .frame(width: 150)
                                
                                Circle()
                                    .stroke(.black)
                                    .fill(.secondary)
                                    .frame(width: 20)
                            }
                            
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: UIScreen.main.bounds.width * 0.89, height: 32)
                                .foregroundStyle(.secondary)
                            
                            HStack {
                                Text("17:30")
                                
                                Rectangle()
                                    .frame(width: 100, height: 5)
                                
                                Spacer()
                                    .frame(width: 150)
                                
                                Circle()
                                    .stroke(.black)
                                    .fill(.secondary)
                                    .frame(width: 20)
                            }
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: UIScreen.main.bounds.width * 0.89, height: 50)
                                .foregroundStyle(.secondary)
                            
                            HStack {
                                Text("17:30")
                                
                                VStack (alignment: .leading){
                                    Rectangle()
                                        .frame(width: 100, height: 5)
                                    
                                    Rectangle()
                                        .frame(width: 200, height: 5)
//                                        .padding(.leading, 100)
                                }
                                
                                Spacer()
                                    .frame(width: 50)
                                
                                Circle()
                                    .stroke(.black)
                                    .fill(.secondary)
                                    .frame(width: 20)
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Cor Principal")
                        .font(.title)
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
                                    
//                                if textLayout == 1 {
//                                    if let firstLetter = color.rawValue.first {
//                                        Text(String(firstLetter))
//                                            .bold()
//                                            .foregroundStyle(.black)
//                                            .textCase(.uppercase)
//                                            
//                                    } else {
//                                        Text("?")
//                                    }
//                                }
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Tipo de Layout")
                        .font(.title)
                        .bold()
                    
                    Spacer()
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
