//
//  OnboardingView.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import SwiftUI

///Esta View cuida da exibição das demais telas do fluxo inicial do app, mediando qual tela deve ser exibida a partir da rota armazenada no AppState.
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

