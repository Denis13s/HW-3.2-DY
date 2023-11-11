//
//  DataService.swift
//  HW-3.2-DY
//
//  Created by Denis Yarets on 11/11/2023.
//

import Foundation

final class DataService {
    
    static let shared = DataService()
    
    var fruits = [Fruit]()
    
    private init() {
        getJSONData()
    }
}

extension DataService {
    
    func getJSONData() {
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else {
            print("Unable to create url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "Unable to create data")
                return
            }
            
            // SHould be dispatch or not?
            do {
                let fruits = try JSONDecoder().decode([Fruit].self, from: data)
                self.fruits = fruits
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
