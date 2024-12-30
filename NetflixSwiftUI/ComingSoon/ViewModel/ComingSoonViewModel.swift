//
//  ComingSoonViewModel.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 30/12/2024.
//

import Foundation

class ComingSoonViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    init() {
        movies = generateMovies(count: 16)
    }
}
