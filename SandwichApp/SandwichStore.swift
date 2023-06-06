//
//  SandwichStore.swift
//  SandwichApp
//
//  Created by Tia Lendor on 5/30/23.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches: [Sandwich]
    
    init(sandwiches: [Sandwich] = []) {
        self.sandwiches = sandwiches
    }
    
    func ChefsChoice() -> Sandwich {
       
        return newSandwiches.randomElement() ?? Sandwich(name: "Sushi", ingredientCount: 6, isSpicy: true)
    }
}

let testStore = SandwichStore(sandwiches: testData)

let newSandwiches = [
    Sandwich(name: "Patty Melt", ingredientCount: 4, isSpicy: false),
    Sandwich(name: "Smoked Tuna", ingredientCount: 6, isSpicy: true),
    Sandwich(name: "Peanut Butter&Jam", ingredientCount: 2, isSpicy: false),
    Sandwich(name: "Lobster Roll", ingredientCount: 4, isSpicy: false),
    Sandwich(name: "Kale Wrap", ingredientCount: 4, isSpicy: false)
]
