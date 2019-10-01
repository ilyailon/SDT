//
//  myChatTest.swift
//  myChatTest
//
//  Created by Sunrise on 18/09/2019.
//  Copyright © 2019 Sunrise. All rights reserved.
//

import XCTest
@testable import myChat

class myChatTest: XCTestCase {
    func testExample() {
    let message = MessageDetail(recipient: "0")
    XCTAssert((message != nil), "Somthing wrong with recipient")
    }
    
}

