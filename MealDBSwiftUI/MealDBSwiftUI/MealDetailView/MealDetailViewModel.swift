//
//  MealDetailViewModel.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/5/23.
//

import Foundation

class MealDetailViewModel: ObservableObject {
      
    @Published var meal: Meal = Meal()
    @Published var filteredIngredients: [String] = []
    @Published var filteredMeasures: [String] = []
    @Published var formattedInstructions = ""
    var imageURL: URL? {
        return URL(string: meal.strMealThumb ?? "")
    }
    var strMeal: String {
        meal.strMeal?.capitalized ?? "Unknown Meal"
    }
    
    let service: MealServicing
    
    init(meal: Meal, service: MealServicing) {
        self.meal = meal
        self.service = service
    }
    
    func fetchSingleMeal() {
        service.fetchMeal(mealID: meal.id) { [weak self] result in
            guard let self else { return }
            Task { @MainActor in
                switch result {
                case .success(let meal):
                    self.meal = meal
                    self.filterIngredients()
                    self.filterMeasures()
                    self.formattedInstructions = meal.strInstructions?.updateLineSpacing() ?? "Unknown recipe"
                case .failure(let error):
                    print("Error fetching single meal: \(error)")
                }
            }
        }
    }
    
    func filterIngredients() {
        let ingredients = [
            meal.strIngredient1, meal.strIngredient2, meal.strIngredient3, meal.strIngredient4, meal.strIngredient5, meal.strIngredient6, meal.strIngredient7, meal.strIngredient8, meal.strIngredient9, meal.strIngredient10, meal.strIngredient11, meal.strIngredient12, meal.strIngredient13, meal.strIngredient14, meal.strIngredient15, meal.strIngredient16, meal.strIngredient17, meal.strIngredient18, meal.strIngredient19, meal.strIngredient20
        ]
        filteredIngredients = ingredients.compactMap { $0 }.filter { !$0.isReallyEmpty }
    }

    func filterMeasures() {
        let measures = [
            meal.strMeasure1, meal.strMeasure2, meal.strMeasure3, meal.strMeasure4, meal.strMeasure5, meal.strMeasure6, meal.strMeasure7, meal.strMeasure8, meal.strMeasure9, meal.strMeasure10, meal.strMeasure11, meal.strMeasure12, meal.strMeasure13, meal.strMeasure14, meal.strMeasure15, meal.strMeasure16, meal.strMeasure17, meal.strMeasure18, meal.strMeasure19, meal.strMeasure20
        ]
        filteredMeasures = measures.compactMap { $0 }.filter { !$0.isReallyEmpty }
    }
}
