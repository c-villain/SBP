import SwiftUI

@available(iOS 13, *)
public enum SBPCircle: String, CaseIterable {
    case bold = "SBPCirce-Bold"
    case light = "SBPCirce-Light"
    case regular = "SBPCirce-Regular"
}

@available(iOS 13, *)
extension Font {
    public static func spb(_ spbFont: SBPCircle, size: CGFloat) -> Font {
        return .custom(spbFont.rawValue, size: size)
    }
}

@available(iOS 13, *)
@discardableResult
public func registerFonts() -> Bool {
  [
    registerFont(bundle: .sbp, fontName: SBPCircle.bold.rawValue, fontExtension: "otf"),
    registerFont(bundle: .sbp, fontName: SBPCircle.light.rawValue, fontExtension: "otf"),
    registerFont(bundle: .sbp, fontName: SBPCircle.regular.rawValue, fontExtension: "otf"),
  ]
  .allSatisfy { $0 }
}

@available(iOS 13, *)
private func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {
  guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
    return false
  }

  guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
    return false
  }

  guard let font = CGFont(fontDataProvider) else {
    return false
  }

  var error: Unmanaged<CFError>?

  guard CTFontManagerRegisterGraphicsFont(font, &error) else {
    print(
      """
      Error registering font: \(fontName). Maybe it was already registered.\
      \(error.map { " \($0.takeUnretainedValue().localizedDescription)" } ?? "")
      """
    )
    return true
  }

  return true
}
