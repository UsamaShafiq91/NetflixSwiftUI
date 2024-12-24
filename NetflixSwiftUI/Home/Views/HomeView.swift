//
//  HomeView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import SwiftUI

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case allGenres = "All Genres"
    case action = "Action"
    case comedy = "Comedy"
    case horror = "Horror"
    case thriller = "Thriller"
}

struct HomeView: View {
    
    var homeViewModel = HomeViewModel()
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var selectedTopRow: HomeTopRow = .home
    @State private var selectedGenre: HomeGenre = .allGenres
    @State private var showTopRowPicker: Bool = false
    @State private var showGenrePicker: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack {
                    TopRowView(selectedTopRow: $selectedTopRow,
                               selectedGenre: $selectedGenre,
                               showTopRowPicker: $showTopRowPicker,
                               showGenrePicker: $showGenrePicker)
                    
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: UIScreen.main.bounds.width)
                        .padding(.top, -100)
                        .zIndex(-1)
                                        
                    HomeContentView(homeViewModel: homeViewModel,
                                    selectedTopRow: selectedTopRow,
                                    movieDetailToShow: $movieDetailToShow)
                }
                .foregroundStyle(.white)
            }
            .scrollIndicators(.hidden)
            
            if let movieDetailToShow = movieDetailToShow {
                withAnimation(.easeIn, {
                    MovieDetailView(movie: movieDetailToShow,
                                    movieDetailToShow: $movieDetailToShow)
                })
            }
            
            if showTopRowPicker {
                ZStack {
                    Color.black
                        .opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { option in
                            Button(action: {
                                selectedTopRow = option
                                showTopRowPicker = false
                            }, label: {
                                Text(option.rawValue)
                                    .fontWeight(selectedTopRow == option ? .bold : .none)
                                    .foregroundStyle(selectedTopRow == option ? Color.white : Color.gray)
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showTopRowPicker = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                        })
                        .padding(.bottom, 30)
                    }
                }
                .ignoresSafeArea()
                .font(.title2)
                .foregroundStyle(.white)
            }
            
            if showGenrePicker {
                ZStack {
                    Color.black
                        .opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ScrollView {
                            ForEach(homeViewModel.genres, id: \.self) { genre in
                                Button(action: {
                                    selectedGenre = genre
                                    showGenrePicker = false
                                }, label: {
                                    Text(genre.rawValue)
                                        .fontWeight(selectedGenre == genre ? .bold : .none)
                                        .foregroundStyle(selectedGenre == genre ? Color.white : Color.gray)
                                })
                                .padding(.bottom, 40)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGenrePicker = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                        })
                        .padding(.bottom, 30)
                    }
                }
                .ignoresSafeArea()
                .font(.title2)
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    HomeView()
}
