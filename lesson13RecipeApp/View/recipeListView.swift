//
//  ContentView.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 09/03/22.
//

import SwiftUI

struct recipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                Text("All Recipes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                    .padding([.top], 20)
                ScrollView() {
                    
                    LazyVStack(alignment: .leading) {
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
            }
          
            .navigationBarHidden(true)
        }
       
    }
}

struct recipeListView_Previews: PreviewProvider {
    static var previews: some View {
        recipeListView()
            .environmentObject(RecipeModel())
    }
}
