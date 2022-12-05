import SwiftUI

@available(iOS 13, *)
public extension Image {
    enum Icons {
        public static let logo = Image("logo", bundle: .sbp)
        public static let close = Image("close", bundle: .sbp)
        public static let back = Image("chevron-left", bundle: .sbp) 
    }
}
