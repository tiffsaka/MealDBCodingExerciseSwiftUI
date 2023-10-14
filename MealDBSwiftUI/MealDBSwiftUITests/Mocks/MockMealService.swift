//
//  MockMealService.swift
//  MealDBSwiftUITests
//
//  Created by Tiffany Sakaguchi on 10/9/23.
//

import Foundation
@testable import MealDBSwiftUI

class MockMealService: MealServicing {
    
    func fetchMeals() async throws -> [Meal] {
        return [
            Meal(strMeal: "dessert1",
                 strMealThumb: "thumb1",
                 idMeal: "id1",
                 strInstructions: "These are the instructions to cook this meal.",
                 strIngredient1: "flour",
                 strMeasure1: "1 cup"),
            Meal(strMeal: "dessert2",
                 strMealThumb: "thumb2",
                 idMeal: "id2",
                 strInstructions: "These are the instructions to cook this meal.",
                 strIngredient1: "salt",
                 strMeasure1: "2 tsp")
        ]
    }
    
    func fetchMeal(mealID: String) async throws -> Meal {
        return Meal(strMeal: "dessert1",
                    strMealThumb: "thumb1",
                    idMeal: "id1",
                    strInstructions: "These are the instructions to cook this meal.",
                    strIngredient1: "flour",
                    strMeasure1: "1 cup")
    }
}
