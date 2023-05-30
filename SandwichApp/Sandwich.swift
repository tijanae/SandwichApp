//
//  Sandwich.swift
//  SandwichApp
//
//  Created by Tia Lendor on 5/30/23.
//

import Foundation

struct Sandwich: Identifiable {
    var id = UUID()
    var name: String
    var ingredientCount: Int
    var isSpicy: Bool = false
    
    var imageName: String { return name}
    var thumbnailName: String{ return name + "Thumb" }
}

let testData = [
    Sandwich(name: "Club", ingredientCount: 4, isSpicy: false),
    Sandwich(name: "Turkey Pastrami", ingredientCount: 4, isSpicy: true),
    Sandwich(name: "Banh Mi", ingredientCount: 5, isSpicy: true),
    Sandwich(name: "Ice Cream Sandwich", ingredientCount: 2, isSpicy: false),
    Sandwich(name: "Italian Hotdog", ingredientCount: 6, isSpicy: true),
    Sandwich(name: "Fluffernutter", ingredientCount: 2, isSpicy: false),
    Sandwich(name: "Avocado Toast", ingredientCount: 4, isSpicy: false),
    Sandwich(name: "Turkey BLT", ingredientCount: 4, isSpicy: false)
]
