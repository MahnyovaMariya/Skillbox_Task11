import XCTest

class Skillbox_Task11UITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {}
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func test_FirstCorrectHandlingCorrectData() {
        
        app.textFields["LogIn"].tap()
        app.textFields["LogIn"].typeText("firstCorrectTest@test.tt")
        
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("09rih,O")
        
        app.buttons["Enter"].tap()
        
        XCTAssertEqual(app.staticTexts.element(boundBy: 1).label, "Succeed :)")
    }
    
    func test_SecondCorrectHandlingCorrectData() {
        
        app.textFields["LogIn"].tap()
        app.textFields["LogIn"].typeText("secondCorrectTest@testtest.tt")
        
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("09rih,O")
        
        XCTAssertEqual(app.staticTexts.element(boundBy: 1).label, "")
        XCTAssertEqual(app.staticTexts.element(boundBy: 2).label, "")
        
        app.buttons["Enter"].tap()
    
        app.swipeDown()
    }
    
    func test_ThirdCorrectHandlingCorrectData() {
        
        app.textFields["LogIn"].tap()
        app.textFields["LogIn"].typeText("thirdCorrectTest@test.tttest")
        
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("09rih,O000;!")
        
        XCTAssertEqual(app.staticTexts.element(boundBy: 1).label, "")
        XCTAssertEqual(app.staticTexts.element(boundBy: 2).label, "")
        
        app.buttons["Enter"].tap()
        
        app.tap()
    }
    
    func test_FirstCorrectHandlingIncorrectData() {

        app.textFields["LogIn"].tap()
        app.textFields["LogIn"].typeText("firstIncorrectTest@testtt")
        
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("09rih,OPJPPPhgfuyjv")
        
        app.buttons["Enter"].tap()

        XCTAssertEqual(app.staticTexts.element(boundBy: 0).label, "Not a valid email")
        XCTAssertEqual(app.staticTexts.element(boundBy: 2).label, "")
    }

    func test_SecondCorrectHandlingIncorrectData() {

        app.textFields["LogIn"].tap()
        app.textFields["LogIn"].typeText("secondIncorrectTest@test.tt")
        
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("09rih,")
        
        app.buttons["Enter"].tap()

        XCTAssertEqual(app.staticTexts.element(boundBy: 2).label, "")
        XCTAssertEqual(app.staticTexts.element(boundBy: 0).label, "Not a valid password")
    }
    
    func test_ThirdCorrectHandlingIncorrectData() {

        app.textFields["LogIn"].tap()
        app.textFields["LogIn"].typeText(" ")
        
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText(" ")
        
        app.buttons["Enter"].tap()

        XCTAssertEqual(app.staticTexts.element(boundBy: 0).label, "Not a valid email")
        XCTAssertEqual(app.staticTexts.element(boundBy: 1).label, "Not a valid password")
    }
}
