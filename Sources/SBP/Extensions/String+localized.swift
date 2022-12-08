import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, tableName: "Localized", bundle: .sbp, value: "", comment: "")
    }
}
