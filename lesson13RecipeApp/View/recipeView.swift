//
//  ContentView.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 09/03/22.
//

import SwiftUI

struct recipeView: View {
    
  @ObservedObject  var model = RecipeModel()
    
    var body: some View {
        
        NavigationView(){
            ScrollView() {
                
                VStack(alignment: .leading) {
                    ForEach (model.recipes) { r in
                        NavigationLink(destination: recipeDetailView(recipe: r)) {
                            HStack(alignment: .center) {
                                
                                Image(r.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50 , height: 50, alignment: .center)
                                    .clipped()
                                    .cornerRadius(5)
                                    .padding(.leading)
                                Text(r.name)
                                    .padding()
                                    .accentColor(.black)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("All Recipe list")
        }
        
    }
}

struct recipeView_Previews: PreviewProvider {
    static var previews: some View {
        recipeView()
    }
}
