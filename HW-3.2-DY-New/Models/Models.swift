//
//  Models.swift
//  HW-3.2-DY
//
//  Created by Denis Yarets on 11/11/2023.
//

import Foundation

struct Fruit: Decodable {
    let name: String
    let id: Int
    let family: String
    let order: String
    let genus: String
    let nutritions: Nutrition
    
    var description: String {
        "\(name) is a fruit of \(family) family\n\(nutritions.description)"
    }
}

struct Nutrition: Decodable {
    let calories: Double
    let fat: Double
    let sugar: Double
    let carbohydrates: Double
    let protein: Double
    
    var description: String {
        "Nutrition facts:\nCalories: \(calories) kKal\nFat: \(fat) g\nSugar: \(sugar) g\nCarbohydrated: \(carbohydrates) g\nProtein: \(protein) g"
    }
}
