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
    
    var genres: [HomeGenre] = [.allGenres, .action, .comedy]
    
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
    
    func getCategoryMovies(category: String, 
                           selectedTopRow: HomeTopRow,
                           selectedGenre: HomeGenre) -> [Movie] {
        switch selectedTopRow {
        case .home:
            return movies[category] ?? []
        case .tvShows:
            return (movies[category] ?? []).filter({$0.movieType == .tvShow && $0.genre == selectedGenre})
        case .movies:
            return (movies[category] ?? []).filter({$0.movieType == .movie && $0.genre == selectedGenre})
        default:
            return movies[category] ?? []
        }
        
    }
}
