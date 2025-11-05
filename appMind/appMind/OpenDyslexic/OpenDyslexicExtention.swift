import SwiftUI
import UIKit



extension Font {
    static func changeFont(fontType: String = "deodemo", fontStyle: Font.TextStyle = .body, fontWeight: Weight = .regular) -> Font {
        if fontType.contains("OpenDyslexic")  {
            return Font.custom(OpenDyslexicFont(weight: fontWeight).rawValue, size: fontStyle.size)
        } else {
            return Font.system(size: fontStyle.size, weight: fontWeight, design: .default)
        }
    }
}

extension UIFont {
    static func changeFont(fontType: String = "deodemo", fontStyle: Font.TextStyle = .body, fontWeight: UIFont.Weight = .regular) -> UIFont {
        
        if fontType.contains("OpenDyslexic") {
            return UIFont(name: OpenDyslexicFont(weight: fontWeight).rawValue, size: fontStyle.size) ?? UIFont.systemFont(ofSize: fontStyle.size, weight: fontWeight) //colocar optional
        } else {
            return UIFont.systemFont(ofSize: fontStyle.size, weight: fontWeight)
        }
    }
}

public func currentFont(to newFont: String) {
    
//    @AppStorage("font") private var font = ""
    
    let appearance = UINavigationBarAppearance()
//    let appearance2 = UITabBarItem.appearance()

    appearance.largeTitleTextAttributes = [
        NSAttributedString.Key.font: UIFont.changeFont(
            fontType: newFont,
            fontStyle: Font.TextStyle.title,
            fontWeight: UIFont.Weight.bold
        )
    ]
    appearance.titleTextAttributes = [
        NSAttributedString.Key.font: UIFont.changeFont(
            fontType: newFont,
            fontStyle: Font.TextStyle.title,
            fontWeight: UIFont.Weight.bold
        )
    ]
    
//    let attributes = [NSAttributedString.Key.font: UIFont.changeFont(fontType: newFont)]
    
    
    UISegmentedControl.appearance().setTitleTextAttributes ([
        NSAttributedString.Key.font: UIFont.changeFont(
        fontType: newFont,
        fontWeight: UIFont.Weight.regular
    )], for: .normal)

    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
    
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 30
        case .title: return 30
        case .title2: return 24
        case .title3: return 20
        case .headline: return 18
        case .body: return 16
        case .callout: return 15
        case .subheadline: return 14
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: return 8
        }
    }
}

extension UIFont.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 34
        case .title1: return 30
        case .title2: return 24
        case .title3: return 20
        case .headline: return 18
        case .body: return 16
        case .callout: return 15
        case .subheadline: return 14
        case .footnote: return 13
        case .caption1: return 12
        case .caption2: return 11
        default: return 8
        }
    }
}

enum OpenDyslexicFont: String {
    case regular = "OpenDyslexic-Regular"
    case bold = "OpenDyslexic-Bold"
    
    init(weight: Font.Weight) {
        switch weight {
        case .regular:
            self = .regular
        case .bold:
            self = .bold
        default:
            self = .regular
        }
    }
    
    init(weight: UIFont.Weight) {
        switch weight {
        case .bold:
            self = .bold
        case .regular:
            self = .regular
        default:
            self = .regular
        }
    }
}
