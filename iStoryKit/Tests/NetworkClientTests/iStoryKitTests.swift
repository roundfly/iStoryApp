import XCTest
@testable import iStoryKit

final class iStoryKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(iStoryKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
