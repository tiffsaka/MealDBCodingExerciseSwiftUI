//
//  MealDetailViewModelTests.swift
//  MealDBSwiftUITests
//
//  Created by Tiffany Sakaguchi on 10/13/23.
//

import XCTest
@testable import MealDBSwiftUI

class MealDetailViewModelTests: XCTestCase {

    var viewModel: MealDetailViewModel!

    override func setUp() {
        super.setUp()
        viewModel = MealDetailViewModel(meal: Meal(), service: MockMealService())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchSingleMeal() {
        viewModel.fetchSingleMeal()
        
        // Expectation to wait for the async operation to complete
        let expectation = XCTestExpectation(description: "FetchSingleMeal")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // verify that the meal has been updated with data
            XCTAssertEqual(self.viewModel.meal.strMeal, "dessert1")
            
            expectation.fulfill()
        }
        
        // Wait for the expectation with a timeout
        XCTWaiter().wait(for: [expectation], timeout: 5)
    }
    
    func testFilterIngredients_WhenAllIngredientsAreEmpty_ShouldReturnEmptyArray() {
        let meal = Meal()

        viewModel.meal = meal
        viewModel.filterIngredients()

        XCTAssertTrue(viewModel.filteredIngredients.isEmpty)
    }
    
    func testFilterIngredients_WhenSomeIngredientsAreEmpty_ShouldRemoveEmptyIngredients() {
        let meal = Meal(
            strIngredient1: "Ingredient 1",
            strIngredient2: "",
            strIngredient3: nil,
            strIngredient4: "Ingredient 4",
            strIngredient5: "    "
        )
        viewModel.meal = meal
        viewModel.filterIngredients()
        XCTAssertEqual(viewModel.filteredIngredients, ["Ingredient 1", "Ingredient 4"])
    }
    
    func testFilterIngredients_WhenAllIngredientsAreNonEmpty_ShouldReturnAllIngredients() {
        let meal = Meal(
            strIngredient1: "Ingredient 1",
            strIngredient2: "Ingredient 2",
            strIngredient3: "Ingredient 3",
            strIngredient4: "Ingredient 4"
        )

        viewModel.meal = meal
        viewModel.filterIngredients()

        XCTAssertEqual(viewModel.filteredIngredients, ["Ingredient 1", "Ingredient 2", "Ingredient 3", "Ingredient 4"])
    }
    
    func testFilterMeasures_WhenAllMeasuresAreEmpty_ShouldReturnEmptyArray() {
        let meal = Meal()

        viewModel.meal = meal
        viewModel.filterMeasures()

        XCTAssertTrue(viewModel.filteredMeasures.isEmpty)
    }
    
    func testFilterMeasures_WhenSomeMeasuresAreEmpty_ShouldRemoveEmptyMeasures() {
        let meal = Meal(
            strMeasure1: "Measure 1",
            strMeasure2: "",
            strMeasure3: " ",
            strMeasure4: "Measure 4",
            strMeasure5: "    "
        )
        viewModel.meal = meal
        viewModel.filterMeasures()
        XCTAssertEqual(viewModel.filteredMeasures, ["Measure 1", "Measure 4"])
    }
    
    func testFilterMeasures_WhenAllMeasuresAreNonEmpty_ShouldReturnAllMeasures() {
        let meal = Meal(
            strMeasure1: "Measure 1",
            strMeasure2: "Measure 2",
            strMeasure3: "Measure 3",
            strMeasure4: "Measure 4"
        )

        viewModel.meal = meal
        viewModel.filterMeasures()

        XCTAssertEqual(viewModel.filteredMeasures, ["Measure 1", "Measure 2", "Measure 3", "Measure 4"])
    }
}
