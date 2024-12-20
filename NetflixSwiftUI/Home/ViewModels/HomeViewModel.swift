//
//  HomeViewModel.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var movies: [String: [Movie]] = [:]
    
    var allCategories: [String] {
        movies.keys.map({String($0)})
    }
    
    init() {
        setupMovies()
    }
    
    private func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Standup Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci Fi"] = exampleMovies.shuffled()
    }
    
    func getCategoryMovies(category: String) -> [Movie] {
        return movies[category] ?? []
    }
}
