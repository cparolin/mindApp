//
//  JournalConclusionView.swift
//  appMind
//
//  Created by Dayô Araújo on 21/10/25.
//
import Combine
import SwiftUI
import SwiftData

struct JournalConclusionView: View {
    @AppStorage("font") private var font = "SF Pro"
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    // View properties
    var existingJournal: JournalModel?
    var journalType: JournalTypeModel
    var answers: [String]
    let descLength: Int = 50
    let titleLength: Int = 18
    
    // State properties
    @State private var title: String
    @State private var desc: String
    @State private var date: Date
    
    var titleCountdown: Int {
        titleLength - title.count
    }
    
    var descCountdown: Int {
        descLength - desc.count
    }
    
    init(existingJournal: JournalModel? = nil, journalType: JournalTypeModel, answers: [String]) {
        self.existingJournal = existingJournal
        self.journalType = journalType
        self.answers = answers
        
        /// initializes the state properties with a default value or the existing journal value
        _title = State(initialValue: existingJournal?.title ?? "")
        _desc = State(initialValue: existingJournal?.desc ?? "")
        _date = State(initialValue: existingJournal?.date ?? Date.now)
    }
    
    /// creates a new note instance or updates an existing instance
    func createNote() {
        //update
        if let existing = existingJournal {
            existing.title = title
            existing.desc = desc
            existing.date = date
            existing.answers = answers
        } else {
            //create
            let newNote = JournalModel(title: title, desc: desc, date: date, answers: answers, journalType: journalType, isFavorite: false)
            context.insert(newNote)
            try? context.save()
        }
        
        dismiss()
    }
    
    var body: some View {
        VStack (spacing: 8){
            TextField("Título do Registro", text: $title)
                .font(.changeFont(fontType: font, fontStyle: .title2, fontWeight: .bold))

                .onReceive(Just(title)) {
                    title = String($0.prefix(titleLength))
                }
            
            Text("\(titleCountdown)/\(titleLength)")
                .font(.changeFont(fontType: font, fontStyle: .caption, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                .foregroundStyle(.cinza3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 17)
            
            TextField("Descrição Breve", text: $desc, axis: .vertical)
                .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))

                .onReceive(Just(desc)) {
                    desc = String($0.prefix(descLength))
                }
            
            Divider()
                .padding(.top, 4)
            
            Text("\(descCountdown)/\(descLength)")
                .font(.changeFont(fontType: font, fontStyle: .caption, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                .foregroundStyle(.cinza3)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            DatePicker("Data do Registro", selection: $date, displayedComponents: .date)
                .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: .regular))
                .padding(.top, 15)
            
            Spacer()
        }
        .padding(30)
        .navigationTitle(existingJournal == nil ? "Finalizar Registro" : "Editar Registro")
        .font(.changeFont(fontType: font, fontStyle: .title2, fontWeight: .bold))
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(existingJournal == nil ? "Salvar" : "Atualizar") {
                    createNote()
                }
                /// confirmation button is disabled if the fields are empty
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview {
    JournalConclusionView(journalType: JournalTypeModel(type: "Rotina", symbol: "arrow.trianglehead.clockwise", questions: [""]), answers: [""])
}
