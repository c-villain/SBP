import XCTest
@testable import SBP

class APITests: XCTestCase {
    func testGetBankApplications() async throws {
        let banks = try await API.getBankApplications()
        XCTAssert(!banks.isEmpty)
    }
    
    func testMockApi() {
        let banks = Array(Mock.API.getBankApplications().prefix(10))
        XCTAssertEqual(banks.count, 10)
    }
}
