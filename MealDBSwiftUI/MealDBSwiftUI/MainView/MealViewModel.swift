//
//  MealViewModel.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/5/23.
//

import Foundation

class MealViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    
    let service: MealServicing
    
    init(service: MealServicing) {
        self.service = service
    }
    
    func fetchMeals() async {
        do {
            let meals = try await service.fetchMeals()
            await updateMeals(meals: meals)
        } catch {
            print("Error fetching: \(error)")
        }
    }
    
    @MainActor
    private func updateMeals(meals: [Meal]) {
        self.meals = self.sortMeals(meals: meals)
    }
    
    func sortMeals(meals: [Meal]) -> [Meal] {
        let sortedMeals = meals.sorted {
            $0.strMeal ?? "Unknown Recipe" < $1.strMeal ?? "Unknown Recipe"
        }
        return sortedMeals
    }
}
