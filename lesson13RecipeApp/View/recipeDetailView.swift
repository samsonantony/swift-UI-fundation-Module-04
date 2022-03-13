//
//  recipeDetailView.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 10/03/22.
//

import SwiftUI

struct recipeDetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView(){
            VStack(alignment: .leading) {
                // MARK: image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: servings size picker
                
                VStack(alignment: .leading){
                    Text("Select serving size:")
                        .bold()
                        .font(.subheadline)
                        
                    
                    Picker("", selection: $selectedServingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
                    
                }
                .padding()
                
                
                
                // MARK: incredients
                VStack(alignment: .leading){
                    
                    Text("Incredients")
                        .font(.title)
                        .padding([.bottom,.top] ,5)
                    ForEach(recipe.ingredients){ items in
                        
                        Text("> " + items.name)
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
