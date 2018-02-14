//
//  uiTestAppUITests.swift
//  uiTestAppUITests
//
//  Created by Kamil Buczel on 13/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import XCTest
import SBTUITestTunnel

class uiTestAppUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchTunnel()

        let requestMatch = SBTRequestMatch.init(url: SearchScreenConsts.masterEndpoint)
        let returnedResponse = SBTStubResponse.init(fileNamed: TestConstants.Mock.githubResponse,
                                                    returnCode: 200,
                                                    responseTime: 2)
        let _ = app.stubRequests(matching: requestMatch,
                                response: returnedResponse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let enterTextHereTextField = app.textFields["Enter text here"]
        enterTextHereTextField.tap()
        enterTextHereTextField.typeText("test")
        app.buttons["Search"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["gremlins.js"]/*[[".cells.staticTexts[\"gremlins.js\"]",".staticTexts[\"gremlins.js\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["pytest"]/*[[".cells.staticTexts[\"pytest\"]",".staticTexts[\"pytest\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["junruchen.github.io"]/*[[".cells.staticTexts[\"junruchen.github.io\"]",".staticTexts[\"junruchen.github.io\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
}
