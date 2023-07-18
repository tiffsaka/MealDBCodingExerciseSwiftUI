//
//  NetworkLayer.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/4/23.
//

import Foundation

class NetworkLayer {
    
    static func request<T: Decodable>(endpoint: APIEndpoint) async throws -> T {
        guard let url = endpoint.makeURL() else {
            throw NetworkError.invalidURL
        }
        
        print("URL*: \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.httpError(httpResponse.statusCode)
        }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            throw NetworkError.unableToDecode
        }
    }
}
