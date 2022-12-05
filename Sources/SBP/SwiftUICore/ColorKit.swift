import SwiftUI

@available(iOS 13, *)
extension Color {
    public enum Background {
        public static let primary = Color("background_primary", bundle: .module)
        public static let secondary = Color("background_secondary", bundle: .module)
        public static let lightFon = Color("background_light_fon", bundle: .module)
    }
    
    public enum Text {
        public static let primary = Color("text_primary", bundle: .module)
        public static let secondary = Color("text_secondary", bundle: .module)
    }
}
