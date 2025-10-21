//
//  QuestionProgressIndicator.swift
//  appMind
//
//  Created by Dayô Araújo on 20/10/25.
//

import SwiftUI

import SwiftUI

struct QuestionProgressIndicator: View {
    var currentIndex: Int
    var totalSteps: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<totalSteps, id: \.self) { index in
                Capsule()
                    .fill(index <= currentIndex ? Color.blue : Color.gray)
                    .frame(height: 6)
            }
        }
    }
}

#Preview {
    QuestionProgressIndicator(currentIndex: 2, totalSteps: 6)
        .padding(.horizontal, 40)
}
