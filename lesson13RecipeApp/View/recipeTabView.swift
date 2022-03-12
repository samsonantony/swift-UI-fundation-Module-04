//
//  recipeTabView.swift
//  lesson13RecipeApp
//
//  Created by SAMSONANTONY on 11/03/22.
//

import SwiftUI

struct recipeTabView: View {
    var body: some View {
        
        TabView {
            
           recipeFeaturedView()
                .tabItem {
                    VStack{
                    Image(systemName: "star")
                    Text("Featured")
                }
            }
            recipeListView()
                .tabItem{
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                    
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct recipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        recipeTabView()
    }
}
