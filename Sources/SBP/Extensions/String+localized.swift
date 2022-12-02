import Foundation

extension String {
    var localized: String {
        if let path = Bundle.main.path(forResource: "ru", ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: "Localized", bundle: .module, value: "", comment: "")
        }
        return self
    }
}
