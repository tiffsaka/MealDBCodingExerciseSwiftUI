//
//  NetworkError.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/3/23.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .thrownError(let error):
            return "Error: \(error.localizedDescription) -> \(error)"
        case .invalidURL:
            return "Unable to reach the server. Invalid URL."
        case .noData:
            return "The server responded with no data."
        case .unableToDecode:
            return "Unable to decode the data."
        }
    }
}
