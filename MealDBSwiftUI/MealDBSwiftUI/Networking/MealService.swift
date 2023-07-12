//
//  MealService.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/3/23.
//

import Foundation

protocol MealServicing {
    func fetchMeals(completion: @escaping (Result<[Meal], NetworkError>) -> Void)
    func fetchMeal(mealID: String, completion: @escaping (Result<Meal, NetworkError>) -> Void)
}

class MealService: MealServicing {

    func fetchMeals(completion: @escaping (Result<[Meal], NetworkError>) -> Void) {
        NetworkLayer.request(endpoint: .meals) { (result: Result<Meals, NetworkError>) in
            switch result {
            case .success(let meals):
                completion(.success(meals.meals))
            case .failure(let error):
                completion(.failure(.thrownError(error)))
            }
        }
    }
    
    func fetchMeal(mealID: String, completion: @escaping (Result<Meal, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.mealDetails(mealID)

        NetworkLayer.request(endpoint: endpoint) { (result: Result<Meals, NetworkError>) in
            switch result {
            case .success(let meals):
                guard let meal = meals.meals.first else {
                    completion(.failure(.noData))
                    return
                }
                completion(.success(meal))
            case .failure(let error):
                completion(.failure(.thrownError(error)))
            }
        }
    }
}

