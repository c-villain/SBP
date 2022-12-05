import XCTest
@testable import SBP

class APITests: XCTestCase {
    @available(iOS 13, *)
    func testGetBankApplications() async throws {
        let banks = try await API.getBankApplications()
        XCTAssert(!banks.isEmpty)
    }
    
    @available(iOS 13, *)
    func testMockApi() {
        let banks = Array(Mock.API.getBankApplications().prefix(10))
        XCTAssertEqual(banks.count, 10)
    }
}
