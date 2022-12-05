import Foundation

#if !SPM
extension Bundle {
  static var module:Bundle { Bundle(identifier: "com.spm")! }
}
#endif
