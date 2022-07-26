//
//  dmedTests.swift
//  dmedTests
//
//  Created by Andrei Freeman on 7/25/22.
//

import XCTest
@testable import dmed

class dmedTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMD5() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
      var baseText = "1"
      var hashText = MD5(string: baseText)
      XCTAssertEqual(hashText, "c4ca4238a0b923820dcc509a6f75849b")

      baseText = "Hello, World"
      hashText = MD5(string: baseText)
      XCTAssertEqual(hashText, "82bb413746aee42f89dea2b59614f9ef")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
