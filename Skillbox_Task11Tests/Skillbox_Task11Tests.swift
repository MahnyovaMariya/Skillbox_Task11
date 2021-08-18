import XCTest
@testable import Skillbox_Task11

class Skillbox_Task11Tests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testExample() throws {
        
        XCTAssert(ViewController().checkLogInField(text: "firstCheck@m ail.ru") == "Not a valid email" )
        XCTAssert(ViewController().checkLogInField(text: "secondCheck@mail") == "Not a valid email" )
        XCTAssert(ViewController().checkLogInField(text: "thirdCheckmail.ru") == "Not a valid email" )
        XCTAssert(ViewController().checkLogInField(text: "fourthCheck@mail.ru") == "" )
        XCTAssert(ViewController().checkPasswordField(text: "jk7L,") == "Not a valid password" )
        XCTAssert(ViewController().checkPasswordField(text: "jk7L,M") == "" )
        XCTAssert(ViewController().checkPasswordField(text: "jkkljHV") == "Not a valid password" )
        XCTAssert(ViewController().checkPasswordField(text: "jk7907") == "Not a valid password" )
        XCTAssert(ViewController().checkPasswordField(text: "7L,555FR") == "Not a valid password" )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
