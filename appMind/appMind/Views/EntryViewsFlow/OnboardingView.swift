//
//  OnboardingView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState: AppState
    var body: some View {
        VStack {
            switch appState.route {
            case .homeScreen:
                HomeScreenView()
                    .environment(appState)
            case .firstScreen:
                FirstView()
                    .environment(appState)
            case .secondScreen:
                SecondView()
                    .environment(appState)
            case .thirdScreen:
                ThirdView()
                    .environment(appState)
            }
        }
    }
}

