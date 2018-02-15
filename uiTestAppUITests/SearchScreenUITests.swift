//
//  uiTestAppUITests.swift
//  uiTestAppUITests
//
//  Created by Kamil Buczel on 13/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import XCTest
import SBTUITestTunnel

class SearchScreenUITests: XCTestCase {
    let elements = SearchScreenElements.instance
    
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
        app.stubRequestsRemoveAll()
    }
    
    func testLayoutHasBeenCreated() {
        XCTContext.runActivity(named: "Enters text for search") { _ in
            XCTAssert(elements.searchInput.waitForExistence(timeout: 2))
            XCTAssert(elements.searchButton.waitForExistence(timeout: 2))
        }
    }
    
    func testResultsScreenHasBeenShowed() {
        XCTContext.runActivity(named: "Go to results screen") { _ in
            let enterTextHereTextField = elements.searchInput
            enterTextHereTextField.tap()
            enterTextHereTextField.typeText("test")
            
            let searchButton = elements.searchButton
            searchButton.tap()
        }
    }
}
