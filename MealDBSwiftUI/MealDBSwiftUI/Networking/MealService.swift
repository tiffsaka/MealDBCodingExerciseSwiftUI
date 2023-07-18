//
//  MealService.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/3/23.
//

import Foundation

protocol MealServicing {
    func fetchMeals() async throws -> [Meal]
    func fetchMeal(mealID: String) async throws -> Meal
}

class MealService: MealServicing {
    
    func fetchMeals() async throws -> [Meal] {
        let meals: Meals = try await NetworkLayer.request(endpoint: .meals)
        return meals.meals
    }
    
    func fetchMeal(mealID: String) async throws -> Meal {
        let endpoint = APIEndpoint.mealDetails(mealID)
        let meals: Meals = try await NetworkLayer.request(endpoint: endpoint)
        guard let meal = meals.meals.first else {
            throw NetworkError.noData
        }
        return meal
    }
}
