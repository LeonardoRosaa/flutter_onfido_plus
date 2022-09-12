import Foundation
import Onfido
class FlutterOnfidoAppearence : Codable, Equatable {
    
    final let primaryColor: Color
    
    final let primaryTitleColor: Color
    
    final let secondaryTitleColor: Color?
    
    final let primaryBackgroundPressedColor: Color
    
    final let secondaryBackgroundPressedColor: Color
    
    final let buttonCornerRadius: CGFloat
    
    final let fontRegular: String?
    
    final let fontBold: String?
    
    final let supportDarkMode: Bool
    
    init(primaryColor: Color, primaryTitleColor: Color, secondaryTitleColor: Color? = nil, primaryBackgroundPressedColor: Color, secondaryBackgroundPressedColor: Color, buttonCornerRadius: CGFloat, fontRegular: String? = nil, fontBold: String? = nil, supportDarkMode: Bool) {
        self.primaryColor = primaryColor
        self.primaryTitleColor = primaryTitleColor
        self.secondaryTitleColor = secondaryTitleColor
        self.primaryBackgroundPressedColor = primaryBackgroundPressedColor
        self.secondaryBackgroundPressedColor = secondaryBackgroundPressedColor
        self.buttonCornerRadius = buttonCornerRadius
        self.fontRegular = fontRegular
        self.fontBold = fontBold
        self.supportDarkMode = supportDarkMode
    }
    
    var appearence: Appearance {
        let appearence = Onfido.Appearance()
        appearence.primaryColor = primaryColor.value
        appearence.primaryTitleColor = primaryTitleColor.value
        appearence.secondaryTitleColor = secondaryTitleColor?.value
        appearence.primaryBackgroundPressedColor = primaryBackgroundPressedColor.value
        appearence.secondaryBackgroundPressedColor = secondaryBackgroundPressedColor.value
        appearence.buttonCornerRadius = buttonCornerRadius
        appearence.fontRegular = fontRegular
        appearence.fontBold = fontBold
        appearence.supportDarkMode = supportDarkMode
        
        return appearence
    }
    
    static func == (lhs: FlutterOnfidoAppearence, rhs: FlutterOnfidoAppearence) -> Bool {
        return lhs.primaryColor == rhs.primaryColor && lhs.primaryTitleColor == rhs.primaryTitleColor && lhs.primaryBackgroundPressedColor == rhs.primaryBackgroundPressedColor && lhs.secondaryBackgroundPressedColor == rhs.secondaryBackgroundPressedColor && lhs.buttonCornerRadius == rhs.buttonCornerRadius && lhs.fontRegular == rhs.fontRegular && lhs.fontBold == rhs.fontBold && lhs.supportDarkMode == rhs.supportDarkMode && lhs.secondaryTitleColor == rhs.secondaryTitleColor
    }
}

class Color : Codable, Equatable {
    final let red: CGFloat
    
    final let blue: CGFloat
    
    final let green: CGFloat
    
    final let alpha: CGFloat
    
    init(red: CGFloat, blue: CGFloat, green: CGFloat, alpha: CGFloat) {
        self.red = red
        self.blue = blue
        self.green = green
        self.alpha = alpha
    }
    
    var value: UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func == (lhs: Color, rhs: Color) -> Bool {
        return lhs.red == rhs.red && lhs.green == rhs.green && lhs.blue == rhs.blue && lhs.alpha == rhs.alpha
    }
    
   
}
