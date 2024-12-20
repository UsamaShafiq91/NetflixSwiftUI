//
//  HomeView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    var homeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack {
                    
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Image("netflix_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        })
                        .buttonStyle(.plain)
                        
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("TV Shows")
                        })
                        .buttonStyle(.plain)
                        
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Movies")
                        })
                        .buttonStyle(.plain)

                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("My List")
                        })
                        .buttonStyle(.plain)
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 30)
                    
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: UIScreen.main.bounds.width)
                        .padding(.top, -100)
                        .zIndex(-1)
                                        
                    ForEach(homeViewModel.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    ForEach(homeViewModel.getCategoryMovies(category: category)) { movie in
                                        HomeMovieCellView(movie: movie)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                    }
                }
                .foregroundStyle(.white)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
