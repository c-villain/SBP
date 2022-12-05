import SwiftUI

@available(iOS 13, *)
public struct ImageCacheKey: EnvironmentKey {
    public static let defaultValue: ImageCache = TemporaryImageCache()
}

@available(iOS 13, *)
public extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
