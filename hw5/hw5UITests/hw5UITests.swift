//
//  hw5UITests.swift
//  hw5UITests
//
//  Created by aprirez on 10/23/21.
//

import XCTest

class hw5UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    // test is not totally correct because hardly depends on application bundle data
    func testExample() throws {
        let app = XCUIApplication()

        app.launch()
        
        let cell1 = app.collectionViews.children(matching: .any).element(boundBy: 0)
        if cell1.exists {
            XCTAssertTrue(cell1.staticTexts.element(matching: .any, identifier: "Vasja").exists)
            XCTAssertTrue(cell1.staticTexts.element(matching: .any, identifier: "30").exists)
        }
        
        let cell2 = app.collectionViews.children(matching: .any).element(boundBy: 1)
        if cell2.exists {
            XCTAssertTrue(cell2.staticTexts.element(matching: .any, identifier: "Peter").exists)
            XCTAssertTrue(cell2.staticTexts.element(matching: .any, identifier: "56").exists)
        }

        let cell3 = app.collectionViews.children(matching: .any).element(boundBy: 2)
        if cell3.exists {
            XCTAssertTrue(cell3.staticTexts.element(matching: .any, identifier: "Ivan").exists)
            XCTAssertTrue(cell3.staticTexts.element(matching: .any, identifier: "35").exists)
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
