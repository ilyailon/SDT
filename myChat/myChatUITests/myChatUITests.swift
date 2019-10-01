//
//  myChatUITests.swift
//  myChatUITests
//
//  Created by Sunrise on 18/09/2019.
//  Copyright © 2019 Sunrise. All rights reserved.
//

import XCTest

class myChatUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        
    }
    
    override func tearDown() {
        
    }
    
    func testOpenAndWork(){
        
        //given
        let cancelButton = app.buttons["Cancel"]
        let numberText = app.textFields["Number"]
        let passwordSecureTextField = app.secureTextFields["Password"]
        let signInButton = app.buttons["Sing In | Sing Up"]
        let usernameText = app.textFields["username"]
        //then
        if  signInButton.isEnabled {
            XCTAssertTrue(passwordSecureTextField.exists)
            XCTAssertTrue(numberText.exists)
            signInButton.tap()
            XCTAssertTrue(usernameText.exists)
        }
        if cancelButton.isEnabled {
            XCTAssertTrue(usernameText.exists)
            cancelButton.tap()
            XCTAssertTrue(passwordSecureTextField.exists)
            XCTAssertTrue(numberText.exists)
            
        }
        
    }
    
}

