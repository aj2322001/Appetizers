//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Archit  Joshi on 14/02/26.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseUrl: String = "https://6979bdb3cc9c576a8e17871b.mockapi.io/v1/"
    private let appetizerUrl: String = baseUrl + "AppetizerList"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResposne = try decoder.decode([Appetizer].self, from: data)
                completed(.success(decodedResposne))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
    
}
