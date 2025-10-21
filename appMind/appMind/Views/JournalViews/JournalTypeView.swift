//
//  JournalTypeView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//
import SwiftData
import SwiftUI

struct JournalTypeView: View {
    @Environment(\.modelContext) var context
    @Query private var journals: [JournalTypeModel]
    
    @State private var AddJournalSheet = false
    
    func initialJournalsCreation() {
        if journals.isEmpty {
            let routine: JournalTypeModel = JournalTypeModel(type: "Rotina", questions: [
                "O que fiz hoje na minha rotina?",
                "Houve algo que me deixou confortável ou feliz?",
                "Houve algo que me incomodou?",
                "Como eu me senti e o que pensei sobre esse incômodo?",
                "O que funcionou bem na minha rotina?",
                "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"
            ])
            
            let addiction = JournalTypeModel(type: "Vícios", questions: [
                "Qual situação antecedeu a vontade de praticar o hábito disfuncional?",
                "Quais pensamentos disfuncionais surgiram por conta da situação?",
                "Quais emoções surgiram a partir da situação e dos pensamentos disfuncionais?",
                "Qual foi minha reação ou comportamento?",
                "Como eu gostaria de ter reagido?",
                "O que eu posso fazer para me ajudar quando algo parecido acontecer de novo?"
            ])
            
            let socialization = JournalTypeModel(type: "Socialização", questions: [
                "Onde eu estava e com quem?",
                "O que aconteceu na prática? (Descrição da Situação)",
                "Como eu participei dessa interação e como me senti? (Exemplos: falei bastante, mais escutei do que falei, me senti ansioso)",
                "Resultado real da interação (Exemplos: fiquei satisfeito, houve entendimento mútuo)",
                "O que aprendi ou percebi nessa interação? (Exemplos: funcionou melhor quando fiz perguntas)",
                "O que quero manter ou melhorar para a próxima vez?"
            ])
            
            context.insert(routine)
            context.insert(addiction)
            context.insert(socialization)
            
        } else {
            print("Erro")
        }
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(journals) { journal in
                        NavigationLink {
                            JournalListView(journalType: journal)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: UIScreen.main.bounds.width * 0.43, height: 217)
                                    .foregroundStyle(.gray)
                                Text(journal.type)
                                    .foregroundStyle(.black)
                                    .font(.title2)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Meus Diários")
                Spacer()
            }
            .toolbar {
                ToolbarItem (placement: .confirmationAction){
                    Button {
                        AddJournalSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $AddJournalSheet) {
                NewJournalTypeView()
            }
        }
        .onAppear {
            initialJournalsCreation()
        }
    }
}

#Preview {
    JournalTypeView()
}
