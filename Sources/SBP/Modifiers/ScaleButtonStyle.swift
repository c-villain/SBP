import SwiftUI

@available(iOS 13, *)
public struct ScaleButtonStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.linear(duration: 0.2), value: configuration.isPressed)
            .brightness(configuration.isPressed ? -0.05 : 0)
    }
}

@available(iOS 13, *)
public extension ButtonStyle where Self == ScaleButtonStyle {
    static var scale: ScaleButtonStyle {
        ScaleButtonStyle()
    }
}
