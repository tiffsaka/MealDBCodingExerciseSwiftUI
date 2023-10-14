//
//  ExtensionsTests.swift
//  MealDBSwiftUITests
//
//  Created by Tiffany Sakaguchi on 10/14/23.
//

import XCTest
@testable import MealDBSwiftUI

final class ExtensionsTests: XCTestCase {

    func testIsReallyEmpty_WhenStringIsWhitespace_ShouldReturnTrue() {
            let whitespaceString = "   "

            let result = whitespaceString.isReallyEmpty

            XCTAssertTrue(result)
        }
        
        func testIsReallyEmpty_WhenStringContainsNonWhitespaceCharacters_ShouldReturnFalse() {
            let nonEmptyString = "This string is not empty."

            let result = nonEmptyString.isReallyEmpty

            XCTAssertFalse(result)
        }
        
        func testUpdateLineSpacing_WhenStringContainsDoubleLineSpacing_ShouldReturnOriginalString() {
            let stringWithDoubleLineSpacing = "This is a test.\r\n\r\nIt contains double line spacing."

            let updatedString = stringWithDoubleLineSpacing.updateLineSpacing()

            XCTAssertEqual(updatedString, stringWithDoubleLineSpacing)
        }
        
        func testUpdateLineSpacing_WhenStringContainsSingleLineSpacing_ShouldReturnStringWithDoubleLineSpacing() {
            let stringWithSingleLineSpacing = "This is a test.\r\nIt contains single line spacing."
            
            let updatedString = stringWithSingleLineSpacing.updateLineSpacing()

            XCTAssertEqual(updatedString, "This is a test.\r\n\nIt contains single line spacing.")
        }
}
