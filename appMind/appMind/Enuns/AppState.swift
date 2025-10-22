//
//  enumRouts.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation

enum Route: Hashable{
    case firstScreen
    case secondScreen
    case thirdScreen
}

@Observable
class AppState {
    var route: Route = .firstScreen
}
