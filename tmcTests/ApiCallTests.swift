//
//  ApiCallTests.swift
//  tmcTests
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//


import XCTest
@testable import tmc
import ObjectMapper

class ApiCallTests: XCTestCase {

    var userId = 1
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUserData() {
        let e = expectation(description: "Expecting a JSON data not nil")
        
        var userList: [User] = []
        
        ApiHelper.Instance.call(url: Commons.URL_USERS) { response in

            switch (response.result) {
            case .success:
                userList  = Mapper<User>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                XCTAssertTrue(userList.count>0)
                self.userId = userList[0].id ?? 1
                e.fulfill()
            case .failure( let error):
                print(error)
            }
        }

        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testFetchAndFilterPostData() {
        
        let e = expectation(description: "Expecting a Posts data not nil")
                
        ApiHelper.Instance.call(url: Commons.URL_POSTS) { response in

            switch (response.result) {
            case .success:
                let _posts = Mapper<Post>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                
                XCTAssertTrue(_posts.count>0)
                print("Count: \(_posts.count)")
                let posts = _posts.filter{$0.userId == self.userId}
                print("User's Filtered Post Count: \(posts.count)")
                
                XCTAssertTrue(_posts.count>=posts.count)
                
                e.fulfill()
            case .failure( let error):
                print(error)
            }
        }

        waitForExpectations(timeout: 5.0, handler: nil)
    }
}

