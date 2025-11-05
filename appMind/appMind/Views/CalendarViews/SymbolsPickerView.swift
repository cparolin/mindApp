//
//  SymbolsPickerVIew.swift
//  appMind
//
//  Created by André Contarelli Lima on 28/10/25.
//
import SwiftData
import SwiftUI

struct SymbolsPickerView: View {
    @Environment(\.dismiss) private var dismiss
    
    let symbols: [String] = ["book", "person.crop.square.on.square.angled","newspaper", "inset.filled.rectangle.and.cursorarrow","graduationcap", "studentdesk","figure.and.child.holdinghands", "figure.2.right.holdinghands", "figure.cross.training","figure.run.treadmill", "figure.roll.runningpace","figure.mind.and.body", "figure.open.water.swim","figure.baseball", "figure.gymnastics","figure.boxing", "figure.badminton","figure.strengthtraining.traditional", "figure.outdoor.cycle","figure.volleyball", "figure.indoor.cycle","figure.indoor.soccer", "dumbbell","trophy", "trophy","flag.pattern.checkered.2.crossed", "swift","suit.heart", "music.quarternote.3","music.microphone", "duffle.bag","globe.americas", "envelope.open","message", "x.squareroot","play.rectangle.on.rectangle", "gearshape","basket", "camera", "paintbrush.pointed", "dice","creditcard", "stethoscope", "cross.case", "wrench.and.screwdriver","pianokeys", "printer", "house", "suitcase","handbag", "building.columns", "theatermasks", "brazilianrealsign.gauge.chart.lefthalf.righthalf","balloon.2", "fireworks", "fireplace", "shower.handheld","popcorn", "cooktop", "frying.pan", "bed.double","washer", "tent", "mountain.2", "ipod.touch","pin", "mappin.and.ellipse", "signpost.right.and.left", "applepencil.tip","macbook.gen1", "car", "airplane.departure", "airplane.arrival","bus", "ferry", "bicycle", "moped","lungs", "wheelchair", "leaf", "camera.macro","syringe", "pill", "cross", "dog","cat", "pawprint", "hanger", "movieclapper","paintpalette", "cup.and.saucer", "wineglass", "birthday.cake","fork.knife", "brain.head.profile", "eyebrow", "hourglass","globe.desk", "gift", "apple.logo"]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)
    
    @State var selectedIcon: String = ""
    @Binding var tempSelectedIcon: String 
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(symbols.indices, id: \.self) { i in
                        let icon = symbols[i]
                        Button {
                            tempSelectedIcon = icon
                        } label: {
                            if tempSelectedIcon == icon {
                                Image(systemName: symbols[i])
                                    .font(.title)
                                    .foregroundStyle(.blue)
                            } else {
                                Image(systemName: symbols[i])
                                    .font(.title)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        tempSelectedIcon = ""
                        dismiss()
                        //verificar funcionalidade, se o ícone selecionado nao esta sendo salvo
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .principal){
                    Text("Ícone")
                }
                ToolbarItem(placement: .topBarTrailing){
                    
                    Button("OK"){
                        //aplicar funcionalidade de salvar, definir ImagemSelecionada temporaria = ImagemAtual
                        dismiss()
                    }
                }
            }
        }
    }
}
