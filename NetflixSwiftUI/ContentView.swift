//
//  ContentView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentIndex: Int = 0
    @State private var isVisible: Bool = false
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        ZStack {
            TabView {
                HomeView(currentIndex: $currentIndex,
                         isVisible: $isVisible)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                ComingSoonView()
                    .tabItem {
                        Label("Coming Soon", systemImage: "play.rectangle")
                    }
                
                DownloadView()
                    .tabItem {
                        Label("Download", systemImage: "arrow.down.to.line")
                    }
            }
            .accentColor(.white)
            
            if isVisible {
                PreviewListView(movies: exampleMovies,
                                currentIndex: $currentIndex,
                                isVisible: $isVisible)
                .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut, value: isVisible)
    }
}

#Preview {
    ContentView()
}
