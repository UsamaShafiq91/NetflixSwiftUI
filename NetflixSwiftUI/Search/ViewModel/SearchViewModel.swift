//
//  SearchViewModel.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 26/12/2024.
//

import Foundation

enum ViewState {
    case empty
    case loading
    case ready
    case error
}

class SearchViewModel: ObservableObject {
    
    @Published var isLoading = false
    
    @Published var state = ViewState.ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchedMovies: [Movie] = []

    @Published var isShowingPopularMovies = true

    init() {
        getPopularMovies()
    }
    
    private func getPopularMovies() {
        popularMovies = generateMovies(count: 40)
    }
    
    func updateSearchText(text: String) {
        updateViewState(state: .loading)
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResults(text: text)
        }
        else {
            isShowingPopularMovies = true
        }
    }
    
    private func getSearchResults(text: String) {
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            if haveResult == 0 {
                self.searchedMovies = []
                self.state = .empty
            }
            else {
                self.searchedMovies = generateMovies(count: 21)
                self.state = .ready
                self.updateViewState(state: .ready)
            }
        })
    }
    
    private func updateViewState(state: ViewState) {
        DispatchQueue.main.async {
            self.state = state
            self.isLoading = state == .loading
        }
    }
}
