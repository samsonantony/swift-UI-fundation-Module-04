//
//  recipeModel.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 09/03/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
  @Published  var recipes = [Recipe]()
    
    
    init() {
        
        // data is fetched from service
        
        self.recipes = DataService.getLocalData()
        
    }
    
  static  func getPortion(ingredients: Ingredients, recipeServings: Int, targetServing: Int) -> String {
        
        
        
        
        return String(targetServing)
    }

}
