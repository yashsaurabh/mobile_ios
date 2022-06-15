//
//  Real_Estate_AppTests.swift
//  Real Estate AppTests
//
//  Created by ManishaThete on 20/01/22.
//

import XCTest
@testable import Real_Estate_App
import SwiftUI

class Real_Estate_App_Tests: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    var signUpViewModel = SignUpViewModel.shared
    var dealDetailsVM = DealDetailsViewModel.shared
    
    override func setUp() {
        loginViewModel = .init()
    }
    
    //MARK: Login Unit Tests
    
    func testEmailIsValidInLogin() {
        XCTAssertTrue(loginViewModel.isEmailValid(email: "asd@123.com"))
    }
    
    func testPasswordIsValidInLogin() {
        XCTAssertTrue(loginViewModel.isPasswordValid(password: "1234567890"))
    }
    
    //MARK: SignUp Unit Tests
    
    func testEmailIsValidInSignUp() {
        XCTAssertTrue(signUpViewModel.isEmailValid(email: "asd@123.com"))
    }
    
    func testPasswordIsValidInSignUp() {
        XCTAssertTrue(signUpViewModel.isPasswordValid(password: "12345678"))
    }
    
    func testZipCodeValid() {
        XCTAssertTrue(signUpViewModel.validateZipCode(zipCode: "123456"))
    }
    
    func testEmailAndPasswordExistInDatabase() {
        XCTAssertTrue(loginViewModel.fetch(email: "asd@123.com", password: "12345678"))
    }
    
    //MARK: Deal Details Unit Tests
    
    func testDealDetailsView1MandatoryFieldsFilled(){
        XCTAssertTrue(dealDetailsVM.dealDetailsView1Validation(fileNumber: "1", propertyType: "Flat", transactionType: "Rent"))
    }
    
    func testDealDetailsView2MandatoryFieldsFilled(){
        XCTAssertTrue(dealDetailsVM.dealDetailsView2Validation(dealAgentName: "Tarun"))
    }
    
    func testDealDetailsView3MandatoryFieldsFilled(){
        XCTAssertTrue(dealDetailsVM.dealDetailsView3Validation(propertyAddress: "Crystal Park, IT"))
    }
    
    func testDealDetailsView4MandatoryFieldsFilled(){
        XCTAssertTrue(dealDetailsVM.dealDetailsView4Validation(loanNumber: "12345"))
    }
    
    
}
