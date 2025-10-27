//
//  enumRouts.swift
//  Apagar
//
//  Created by Lucca Pivoto on 21/10/25.
//

import Foundation
import SwiftUI

enum Route: Hashable{
    case homeScreen
    case firstScreen
    case secondScreen
    case thirdScreen
}

@Observable
class AppState {
    var route: Route = .homeScreen
    var firstTimeOnApp: Bool = UserDefaults.standard.bool(forKey: "FirstTimeOnApp")
    
    public func setFirstTimeOnApp(value: Bool) {
        UserDefaults.standard.set(value, forKey: "FirstTimeOnApp")
        firstTimeOnApp = UserDefaults.standard.bool(forKey: "FirstTimeOnApp")
    }
}
