import Foundation

class FlutterOnfidoAppearence : Codable, Equatable {
    
    final let primaryColor: Color?
    
    final let primaryTitleColor: Color?
    
    final let primaryBackgroundPressedColor: Color?
    
    final let secondaryBackgroundPressedColor: Color?
    
    final let borderCornerRadius: Int?
    
    final let fontRegular: String?
    
    final let fontBold: String?
    
    final let supportDarkMode: Bool?
    
    init(primaryColor: Color? = nil, primaryTitleColor: Color? = nil, primaryBackgroundPressedColor: Color? = nil, secondaryBackgroundPressedColor: Color? = nil, borderCornerRadius: Int? = nil, fontRegular: String? = nil, fontBold: String?, supportDarkMode: Bool? = nil) {
        self.primaryColor = primaryColor
        self.primaryTitleColor = primaryTitleColor
        self.primaryBackgroundPressedColor = primaryBackgroundPressedColor
        self.secondaryBackgroundPressedColor = secondaryBackgroundPressedColor
        self.borderCornerRadius = borderCornerRadius
        self.fontRegular = fontRegular
        self.fontBold = fontBold
        self.supportDarkMode = supportDarkMode
    }
    
    static func == (lhs: FlutterOnfidoAppearence, rhs: FlutterOnfidoAppearence) -> Bool {
        return lhs.primaryColor == rhs.primaryColor && lhs.primaryTitleColor == rhs.primaryTitleColor && lhs.primaryBackgroundPressedColor == rhs.primaryBackgroundPressedColor && lhs.secondaryBackgroundPressedColor == rhs.secondaryBackgroundPressedColor && lhs.borderCornerRadius == rhs.borderCornerRadius && lhs.fontRegular == rhs.fontRegular && lhs.fontBold == rhs.fontBold && lhs.supportDarkMode == rhs.supportDarkMode
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
