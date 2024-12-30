//
//  ContentView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            Text("Coming Soon")
                .tabItem {
                    Label("Coming Soon", systemImage: "play.rectangle")
                }
            
            Text("Download")
                .tabItem {
                    Label("Download", systemImage: "arrow.down.to.line")
                }
            
            Text("More")
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
        }
        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
