//
//  recipeFeaturedView.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 12/03/22.
//

import SwiftUI

struct recipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    @State var isDetailSelected = false
    
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured recipes")
            
                .font(.largeTitle)
                .bold()
                .padding(.leading)
                .padding([.top], 20)
                
                
            GeometryReader { geo in
                
                TabView(selection: $tabSelectionIndex) {
                    
                    ForEach(0..<model.recipes.count) { Index  in
                        
                        if model.recipes[Index].featured == true {
                           
                            // button to show the recipe detail
                            
                            
                            Button {
                                
                                self.isDetailSelected = true
                                
                            } label: {
                                ZStack {
                                    
                                    // frame size
                                    Rectangle()
                                        .foregroundColor(.white)
                                    // adding images and name
                                    VStack{
                                        Image(model.recipes[Index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[Index].name)
                                            .padding(5)
                                    }
                                    
                                }
                            }
                            .sheet(isPresented: $isDetailSelected){
                                
                                recipeDetailView(recipe: model.recipes[Index])
                                
                            }
                            .tag(Index)
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40 , height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                        }
                    }
                    
                }
                
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 5){
                
                Text("Prep time:")
                    .font(.headline)
                    .bold()
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights:")
                    .font(.headline)
                    .bold()
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                
            }
            .padding([.leading, .bottom])
        }
        .onAppear {
            
                setFeaturedIndex()
          
        }
 
        
    }
    
    // checking the featured recipes
    func setFeaturedIndex() {
        
       var index = model.recipes.firstIndex { Recipe in
            return Recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct recipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
       
        recipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
