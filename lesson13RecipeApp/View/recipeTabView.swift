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
            
            Text("Featured View")
                .tabItem {
                    VStack{
                    Image(systemName: "star")
                    Text("Featured")
                }
            }
            ContentView()
                .tabItem{
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                    
                }
        }
    }
}

struct recipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        recipeTabView()
    }
}
