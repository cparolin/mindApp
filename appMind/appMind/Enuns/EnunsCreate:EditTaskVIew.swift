//
//  EnunsCreate:EditTaskVIew.swift
//  appMind
//
//  Created by Lucca Pivoto on 17/10/25.
//

import Foundation
import SwiftUI
struct EnunsCreateEditTaskVIew {
    
    enum CorTarefa: String {
        
        case blue
        case red
        case yellow
        case orange
        case purple
        case gray
        
        var color: Color {
            switch self {
            case .blue:
                return .blue
                
            case .red:
                return .red
                
            case .yellow:
                return .yellow
                
            case .orange:
                return .orange
                
            case .purple:
                return .purple
                
            case .gray:
                return .gray
            }
        }
    }

    func corPasta(_ cor: Color) -> String {
        var corString: String = "erro"
        switch cor{
        case .yellow:
            corString = "yellow"
        case .blue:
            corString = "blue"
        case .red:
            corString = "red"
        case .orange:
            corString = "orange"
        case .purple:
            corString = "purple"
            
        default:
            corString = "gray"
        }
        return corString
           }

}
