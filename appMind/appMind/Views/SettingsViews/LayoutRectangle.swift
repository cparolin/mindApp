import SwiftUI

struct LayoutRectangle: View {
    
//    @AppStorage("colorLayout") private var colorLayout: ColorCases = .amarelo
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    @AppStorage("textLayout") private var textLayout: Int = 0
    @AppStorage("font") private var font = "SF Pro"
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width * 0.93, height: 230)
                .foregroundStyle(Color("cinza6"))
            VStack{
                HStack{
                    Spacer()
                        .frame(width: 5)
                    
                    ForEach((1...6), id: \.self) { number in
                        if number == 5 {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.width * 0.09, height: 49)
                                .foregroundStyle(Color.accentColor)
                                .padding(.trailing, 5)
                        }
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: UIScreen.main.bounds.width * 0.09, height: 49)
                            .foregroundStyle(.white)
                            .padding(.trailing, 5)
                    }
                    
                }
                
                Spacer()
                    .frame(height: 18)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: UIScreen.main.bounds.width * 0.89, height: 32)
                        .foregroundStyle(Color(getPaletteColor(palette: paletteLayout, color: "cor1")))
                    
                    HStack {
                        
                        if textLayout != 2 {
                            Text("15:00")
                                .frame(width: UIScreen.main.bounds.width * 0.082, height: 10)
                                .font(.changeFont(fontType: font, fontStyle: .caption2, fontWeight: .regular))
//                                .border(.red)
                                
                                
                        }
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.20, height: 4)
//                            .border(.red)
                            .foregroundStyle(Color.black)
                        
                        if textLayout != 2 {
                            Spacer()
                                .frame(width: UIScreen.main.bounds.width * 0.48)
                        } else {
                            Spacer()
                                .frame(width: UIScreen.main.bounds.width * 0.583)
                        }
                        
                        Circle()
                            .stroke(.black)
                            .frame(width: 20)
                    }
                    
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: UIScreen.main.bounds.width * 0.89, height: 32)
                        .foregroundStyle(Color(getPaletteColor(palette: paletteLayout, color: "cor4")))
                    
                    HStack {
                        if textLayout != 2 {
                            Text("17:30")
                                .frame(width: UIScreen.main.bounds.width * 0.082, height: 10)
                                .font(.changeFont(fontType: font, fontStyle: .caption2, fontWeight: .regular))
                        }
                        
                        if textLayout != 2 {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.20, height: 4)
                        } else {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.36, height: 4)
                        }
                        
                        if textLayout != 2 {
                            Spacer()
                                .frame(width: UIScreen.main.bounds.width * 0.48)
                        } else {
                            Spacer()
                                .frame(width: UIScreen.main.bounds.width * 0.423)
                        }
                        
                        Circle()
                            .stroke(.black)
                            .frame(width: 20)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: UIScreen.main.bounds.width * 0.89, height: 50)
                        .foregroundStyle(Color(getPaletteColor(palette: paletteLayout, color: "cor2")))
                    
                    HStack {
                        if textLayout != 2 {
                            Text("17:30")
                                .frame(width: UIScreen.main.bounds.width * 0.082, height: 10)
                                .font(.changeFont(fontType: font, fontStyle: .caption2, fontWeight: .regular))
                        }
                        
                        VStack (alignment: .leading){
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.20, height: 4)
                            
                            if textLayout == 0 {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width * 0.36, height: 4)
                            }
                        }
                        
                        if textLayout == 0 {
                            Spacer()
                                .frame(width:  UIScreen.main.bounds.width * 0.32)
                        } else if textLayout == 1 {
                            Spacer()
                                .frame(width: UIScreen.main.bounds.width * 0.48)
                        } else {
                            Spacer()
                                .frame(width: UIScreen.main.bounds.width * 0.583)
                        }
                        
                        Circle()
                            .stroke(.black)
                            .frame(width: 20)
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    LayoutRectangle()
}
