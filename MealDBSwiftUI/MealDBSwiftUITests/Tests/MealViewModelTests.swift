//
//  MealViewModelTests.swift
//  MealDBSwiftUITests
//
//  Created by Tiffany Sakaguchi on 10/9/23.
//

import XCTest
@testable import MealDBSwiftUI

class MealViewModelTests: XCTestCase {

    var viewModel: MealViewModel!

    override func setUp() {
        super.setUp()
        viewModel = MealViewModel(service: MockMealService())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchMeals() async {
        // Expect that meals array is empty initially
        XCTAssertTrue(viewModel.meals.isEmpty)

        await viewModel.fetchMeals()

        // Expectation to wait for the async operation to complete
        let expectation = XCTestExpectation(description: "FetchMeals")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // verify that the photos array has been updated with data
            XCTAssertEqual(self.viewModel.meals.count, 2)
            XCTAssertEqual(self.viewModel.meals[0].strMeal, "dessert1")
            
            expectation.fulfill()
        }
        
        // Wait for the expectation with a timeout
        await XCTWaiter().fulfillment(of: [expectation], timeout: 5)

        XCTAssertFalse(viewModel.meals.isEmpty)
    }

    func testSortMeals() {
        let unsortedMeals = [
            Meal(strMeal: "Abc Meal", idMeal: "10"),
            Meal(strMeal: "Bzzz Meal", idMeal: "77"),
            Meal(strMeal: "Aaa Meal", idMeal: "3"),
            Meal(strMeal: "Basdf Meal", idMeal: "1"),
            Meal(strMeal: "Baa Meal", idMeal: "555"),
            Meal(strMeal: "Abb Meal", idMeal: "6")
        ]

        let sortedMeals = viewModel.sortMeals(meals: unsortedMeals)

        XCTAssertEqual(sortedMeals.map { $0.strMeal }, ["Aaa Meal", "Abb Meal", "Abc Meal", "Baa Meal", "Basdf Meal", "Bzzz Meal"])
    }
}
