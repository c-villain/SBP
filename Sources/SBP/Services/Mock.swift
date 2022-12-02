import Foundation

struct Mock {}

extension Mock {
    private static func decode<T>(forResource: String) -> T? where T: Decodable {
        var result: T? = nil
        
        do {
            if let path = Bundle.module.path(forResource: forResource, ofType: "json", inDirectory: "Mocks"),
                let jsonData = try String(contentsOfFile: path).data(using: .utf8) {
                result = try JSONDecoder().decode(T.self, from: jsonData)
            }
        }
        catch let error as DecodingError {
            switch error {
            case .typeMismatch(let key, let value):
                debugPrint("❌ Mock \(forResource). Decoding error \(key), value \(value) and description: \(error.localizedDescription)")
                debugPrint("❌ Mock \(forResource). Decoding error Type '\(key)' mismatch:", value.debugDescription)
                debugPrint("❌ Mock \(forResource). Decoding error codingPath:", value.codingPath)
            case .valueNotFound(let key, let value):
                debugPrint("❌ Mock \(forResource). Decoding error \(key), value \(value) and description: \(error.localizedDescription)")
            case .keyNotFound(let key, let value):
                debugPrint("❌ Mock \(forResource). Decoding error \(key), value \(value) and description: \(error.localizedDescription)")
            case .dataCorrupted(let key):
                debugPrint("❌ Mock \(forResource). Decoding error \(key), and description: \(error.localizedDescription)")
            default:
                debugPrint("❌ Mock \(forResource). Decoding error: \(error.localizedDescription)")
            }
        }
        catch {
            assertionFailure("decode \(forResource) \n \(error)")
        }
        return result
    }
}

extension Mock {
    public enum API {
        static func getBankApplications() -> [Bank] {
            let c2b: C2BMembers? = decode(forResource: "getBankApplications")
            guard let c2b = c2b else { return [] }
            return c2b.dictionary
        }
        
        static func checkApps(for schemas: [Bank]) -> [Bank] {
            var banks = schemas
            var total: Int = 0
            for index in banks.indices {
                let mock = Bool.random()
                if mock {
                    total = total + 1
                }
                banks[index].isInstalled = total < 4 ? mock : false
                print("\(banks[index].schema): \(banks[index].isInstalled)")
            }
            return banks
        }
    }
}
