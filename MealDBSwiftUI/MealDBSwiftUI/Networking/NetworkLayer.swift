//
//  NetworkLayer.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/4/23.
//

import Foundation

class NetworkLayer {

    static func request<T: Decodable>(endpoint: APIEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = endpoint.makeURL() else {
            return completion(.failure(.invalidURL))
        }
        
        print("URL*: \(url)")

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }

            guard let data = data else {
                return completion(.failure(.noData))
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                return completion(.success(result))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
}
