import UIKit

public protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

public struct TemporaryImageCache: ImageCache {
    private let cache = NSCache<NSURL, UIImage>()
    
    public subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set {
            if newValue == nil {
                cache.removeObject(forKey: key as NSURL)
            } else {
                if let nw = newValue { cache.setObject(nw, forKey: key as NSURL) }
            }
        }
    }
}
