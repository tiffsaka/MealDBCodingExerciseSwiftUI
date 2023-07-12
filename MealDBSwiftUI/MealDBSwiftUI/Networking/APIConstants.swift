//
//  APIConstants.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/4/23.
//

import Foundation

enum APIEndpoint {
    case meals
    case mealDetails(String)

    var baseURL: URL {
        return URL(string: "https://www.themealdb.com/api/json/v1/1/")!
    }

    var path: String {
        switch self {
        case .meals:
            return "filter.php"
        case .mealDetails:
            return "lookup.php"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .meals:
            return [URLQueryItem(name: "c", value: "Dessert")]
        case .mealDetails(let mealID):
            return [URLQueryItem(name: "i", value: mealID)]
        }
    }

    func makeURL() -> URL? {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        return components?.url
    }
}
