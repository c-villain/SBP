import Foundation

struct C2BMembers: Codable {
    var version: String
    var dictionary: [Bank]
    
    enum CodingKeys: String, CodingKey {
        case version
        case dictionary
    }
}
