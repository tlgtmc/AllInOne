//
//  tmcUITests.swift
//  tmcUITests
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import XCTest

class tmcUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
    
    /*
        This test launches the application and after fetching the data, clicks on the User named "Antonette".
        Then the application will be forwarded to the user detail view.
     */
    func testUserAndNavigateToDetail() {
        print("testUserAndNavigateToDetail")
        
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        
        XCTAssertTrue(tablesQuery.count > 0)
        
        
        XCTAssertTrue(tablesQuery.staticTexts["Antonette"].exists)
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Antonette"]/*[[".cells.staticTexts[\"Antonette\"]",".staticTexts[\"Antonette\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
}
