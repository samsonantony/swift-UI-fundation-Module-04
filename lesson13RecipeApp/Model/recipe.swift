//
//  recipe.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 09/03/22.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    // Declaring the variables
    
    var id:UUID?
    var name:String
    var featured: Bool
    var image:String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [Ingredients]
    var directions: [String]
    var highlights:[String]
    

}

class Ingredients: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
