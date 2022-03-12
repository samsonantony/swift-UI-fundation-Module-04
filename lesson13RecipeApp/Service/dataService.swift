//
//  dataService.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 09/03/22.
//

import Foundation

class DataService {
    
    
   static func getLocalData() -> [Recipe]{
        
       // pathstring
        
        let pathString =  Bundle.main.path(forResource: "recipes", ofType: "json")
     
        
        // check pathString nil or not, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        // URL
        let url = URL(fileURLWithPath: pathString!)
        // Data
        do {
            let data = try Data(contentsOf: url)
            // Decoding Json
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                // Unique ID
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        
                        i.id = UUID()
                    }
                }
                // returning
                return recipeData
            }
            catch{
                // error handling
                print(error)
            }
        }
        
        catch{
            // error handling
            print(error)
        }
        // returning
        return [Recipe]()
    }
}
