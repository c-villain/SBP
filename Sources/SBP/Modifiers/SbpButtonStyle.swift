import SwiftUI

@available(iOS 13, *)
public struct SbpButtonStyle: ButtonStyle {
    private let fullWidth: Bool
    private let height: CGFloat
    private let zoom: Bool // zoom animation
    private let shouldFade: Bool
    private let backgroundColor: Color
    private let cornerRadius: CGFloat
    
    public init (
        shouldFade: Bool = true,
        height: CGFloat = Constants.Buttons.height,
        fullWidth: Bool = true,
        zoomAnimation: Bool = true,
        backgroundColor: Color = Color.Background.lightFon,
        cornerRadius: CGFloat = Constants.Images.defaults) {
            self.fullWidth = fullWidth
            self.height = height
            self.shouldFade = shouldFade
            self.zoom = zoomAnimation
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
        }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10.0)
            .frame(height: height)
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .background(Color.Background.lightFon)
            .cornerRadius(Constants.Images.defaults)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
            )
            .scaleEffect((configuration.isPressed && zoom) ? 0.95 : 1)
            .animation(.linear(duration: 0.2))
            .brightness((configuration.isPressed && shouldFade) ? -0.05 : 0)
    }
}
