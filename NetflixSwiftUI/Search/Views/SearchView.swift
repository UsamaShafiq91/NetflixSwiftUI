//
//  SearchView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 24/12/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var text: String = ""
    @State var isLoading: Bool = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                SearchBar(text: $text,
                          isLoading: $viewModel.isLoading)
                .padding()
                .onChange(of: text, {
                    viewModel.updateSearchText(text: text)
                })
                
                ScrollView {
                    if viewModel.isShowingPopularMovies {
                        PopularMovieView(movies: viewModel.popularMovies,
                                         movieDetailToShow: $movieDetailToShow)
                    }
                    else {
                        if viewModel.state == .empty {
                            Text("Results not found")
                                .font(.headline)
                                .bold()
                                .padding(.top, 150)
                        }
                        else if viewModel.state == .ready {
                            SearchResultView(movies: viewModel.searchedMovies,
                                             movieDetailToShow: $movieDetailToShow)
                        }
                    }
                }
            }
            
            if let movieDetailToShow = movieDetailToShow {
                withAnimation(.easeIn, {
                    MovieDetailView(movie: movieDetailToShow,
                                    movieDetailToShow: $movieDetailToShow)
                })
            }
        }
    }
}

#Preview {
    SearchView()
}
