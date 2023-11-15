//
//  NetworkManager.swift
//  HW-3.2-DY-New
//
//  Created by Denis Yarets on 15/11/2023.
//

import Foundation

enum NetworkErrors: Error {
    case noData
    case decodeError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
}

extension NetworkManager {
    
    func fetchData<T: Decodable>(type: T.Type, url: URL, completionHandler: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completionHandler(.failure(NetworkErrors.noData))
                return
            }
            
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(type))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(NetworkErrors.decodeError))
                }
            }
            
        }.resume()
    }
    
}
