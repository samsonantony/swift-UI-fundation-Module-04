//
//  recipeDetailView.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 10/03/22.
//

import SwiftUI

struct recipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView(){
            VStack(alignment: .leading) {
                // MARK: image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: incredients
                VStack(alignment: .leading){
                    
                    Text("Incredients")
                        .font(.title)
                        .padding([.bottom,.top] ,5)
                    ForEach(recipe.ingredients, id: \.self){ items in
                        
                        Text("> " + items)
                    }
                }
                .padding(.leading)
                Divider()
                // MARK: directions
                
                VStack(alignment: .leading) {
                    
                    Text("Directions")
                        .font(.title)
                        .padding([.bottom,.top], 3)
                    
                    ForEach(0..<recipe.directions.count, id:\.self){ Index in
                        
                        Text(String(Index+1) + ". " + recipe.directions[Index])
                    }
                }
                .padding(.leading)}
            .navigationBarTitle(recipe.name)
        }
    }
}

struct recipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        recipeDetailView(recipe: model.recipes[0])
    }
}
