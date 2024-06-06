import SwiftUI

@available(iOS 13, *)
public extension Image {
    enum Icons {
        public static let logo = Image("logo", bundle: .sbp)
        public static let close = Image(systemName: "xmark")
        public static let back = Image(systemName: "chevron.left")
    }
}
