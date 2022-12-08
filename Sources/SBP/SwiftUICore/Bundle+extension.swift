import Foundation

private class BundleFinder {}

extension Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var sbp: Bundle = {
        let bundleName: String
        
        #if SWIFT_PACKAGE
        bundleName = "SBP_SBP"
        #else
        bundleName = "SBP"
        #endif
        
        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        #if SWIFT_PACKAGE
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        #else
        if let bundle = Bundle(identifier: "com.cocoapods.SBP") {
            return bundle
        }
        #endif
        fatalError("unable to find bundle named SBP")
    }()
}
