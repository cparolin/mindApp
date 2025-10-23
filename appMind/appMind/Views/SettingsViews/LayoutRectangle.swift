import SwiftUI

struct LayoutRectangle: View {
    
    @AppStorage("colorLayout") private var colorLayout: ColorCases = .amarelo
    @AppStorage("textLayout") private var textLayout: Int = 0
    @AppStorage("font") private var font = "SF Pro"
    
    var body: some View {
        
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
                        
                        if textLayout != 2 {
                            Text("15:00")
                                .font(.changeFont(fontType: font, fontWeight: .regular))
                        }
                        
                        Rectangle()
                            .frame(width: 100, height: 5)
                        
                        if textLayout != 2 {
                            Spacer()
                                .frame(width: 150)
                        } else {
                            Spacer()
                                .frame(width: 200)
                        }
                        
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
                        if textLayout != 2 {
                            Text("17:30")
                                .font(.changeFont(fontType: font, fontWeight: .regular))
                        }
                        
                        Rectangle()
                            .frame(width: 100, height: 5)
                        
                        if textLayout != 2 {
                            Spacer()
                                .frame(width: 150)
                        } else {
                            Spacer()
                                .frame(width: 200)
                        }
                        
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
                        if textLayout != 2 {
                            Text("17:30")
                                .font(.changeFont(fontType: font, fontWeight: .regular))
                        }
                        
                        VStack (alignment: .leading){
                            Rectangle()
                                .frame(width: 100, height: 5)
                            
                            if textLayout == 0 {
                                Rectangle()
                                    .frame(width: 200, height: 5)
                            }
                        }
                        
                        if textLayout == 0 {
                            Spacer()
                                .frame(width: 50)
                        } else if textLayout == 1 {
                            Spacer()
                                .frame(width: 150)
                        } else {
                            Spacer()
                                .frame(width: 200)
                        }
                        
                        Circle()
                            .stroke(.black)
                            .fill(.secondary)
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
