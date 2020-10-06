//
//  _0201005_ChristianLorenzo_NYCSchoolsTests.swift
//  20201005-ChristianLorenzo-NYCSchoolsTests
//
//  Created by Christian Lorenzo on 10/5/20.
//

import XCTest
@testable import _0201005_ChristianLorenzo_NYCSchools
import Alamofire

class _0201005_ChristianLorenzo_NYCSchoolsTests: XCTestCase {
    
    func testNetworkingRequest() {
        let e = expectation(description: "Fetching API")
        let mySchoolSearch = NYCSchoolAPI()
        
        mySchoolSearch.getItems { (string, error) in
            XCTAssert((string != nil), "Schools")
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
