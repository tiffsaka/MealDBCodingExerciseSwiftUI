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
    
    func fetchMeals() {
        service.fetchMeals { [weak self] result in
            guard let self else { return }
            Task { @MainActor in
                switch result {
                case .success(let meals):
                    self.meals = self.sortMeals(meals: meals)
                case .failure(let error):
                    print("Error fetching: \(error)")
                }
            }
        }
    }
    
    func sortMeals(meals: [Meal]) -> [Meal] {
        let sortedMeals = meals.sorted {
            $0.strMeal ?? "Unknown Recipe" < $1.strMeal ?? "Unknown Recipe"
        }
        return sortedMeals
    }
}
