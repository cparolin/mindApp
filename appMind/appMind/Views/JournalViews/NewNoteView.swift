//
//  NewNoteView.swift
//  appMind
//
//  Created by Dayô Araújo on 15/10/25.
//
import SwiftData
import SwiftUI

struct NewNoteView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    public var filterType: Category
    
    @State var title = ""
    @State var desc = ""
    @State var answer1 = ""
    @State var answer2 = ""
    @State var answer3 = ""
    @State var answer4 = ""
    @State var answer5 = ""
    @State var answer6 = ""
    @State private var answers: [String] = []
    
    var body: some View {
        NavigationStack {
            
        }
    }
}


#Preview {
    NewNoteView(filterType: .routine)
}
