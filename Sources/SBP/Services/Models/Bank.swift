import Foundation

struct Bank: Identifiable, Codable {
    var id: String { schema }
    
    var name: String
    var logoURL: String
    var schema: String
    
    var isInstalled: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case name = "bankName"
        
        case logoURL
        case schema
    }
}
