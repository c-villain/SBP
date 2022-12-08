import Foundation

private class BundleFinder {}

extension Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var sbp: Bundle = {
        let bundleName: String
        let bundleExtension: String
        
        #if SWIFT_PACKAGE
        bundleName = "SBP_SBP"
        bundleExtension = ".bundle"
        #else
        bundleName = "SBP"
        bundleExtension = ".framework"
        #endif
        
        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + bundleExtension)
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named SBP")
    }()
}
