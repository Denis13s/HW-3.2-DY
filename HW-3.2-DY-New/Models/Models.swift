//
//  Models.swift
//  HW-3.2-DY
//
//  Created by Denis Yarets on 11/11/2023.
//

import Foundation

struct Fruit: Decodable, CustomStringConvertible {
    let name: String
    let id: Int
    let family: String
    let nutritions: Nutrition
    
    var description: String {
        """
        \(name) is a fruit of \(family) family
        \(nutritions)
        """
    }
}

struct Nutrition: Decodable, CustomStringConvertible {
    let calories: Int
    let fat: Int
    let sugar: Int
    let carbohydrates: Int
    let protein: Int
    
    var description: String {
        """
        Nutrition facts:
        Calories: \(calories) kKal
        Fat: \(fat) g
        Sugar: \(sugar) g
        Carbohydrated: \(carbohydrates) g
        Protein: \(protein) g
        """
    }
}
