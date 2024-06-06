import UIKit

@available(iOS 13, *)
open class API {
    
    /**
     Получаем список банков, подключенных к СБП
     
     - parameter url: адрес json-файла со списком банков
     - returns: список банков
     */
    class func getBankApplications(_ url: String = "https://qr.nspk.ru/proxyapp/c2bmembers.json") async throws -> [Bank] {
        guard let url = URL(string: url) else { return [] }
        let urlSession = URLSession.shared
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let members = try JSONDecoder().decode(C2BMembers.self, from: data)
            return members.dictionary
        }
        catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
            return []
        }
    }
    
    /**
     Модифицируем список банков с учетом установленных приложений
     */
    class func checkApps(for schemas: [Bank]) -> [Bank] {
        var banks = schemas
        for index in banks.indices {
            if index < 5 {
                banks[index].isInstalled = true
            }
        }
//        for index in banks.indices {
//            if let url = URL(string: schemas[index].schema + "://") {
//                if UIApplication.shared.canOpenURL(url) {
//                    banks[index].isInstalled = true
//                }
//            }
//        }
        return banks
    }
}

