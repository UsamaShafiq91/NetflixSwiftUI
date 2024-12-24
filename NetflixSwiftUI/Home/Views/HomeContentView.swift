//
//  HomeContentView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 24/12/2024.
//

import SwiftUI

struct HomeContentView: View {
    
    let homeViewModel: HomeViewModel
    let selectedTopRow: HomeTopRow
    
    @Binding var movieDetailToShow: Movie?

    var body: some View {
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
                        ForEach(homeViewModel.getCategoryMovies(category: category, 
                                                                selectedTopRow: selectedTopRow)) { movie in
                            HomeMovieCellView(movie: movie)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                                .padding(.horizontal, 20)
                                .onTapGesture(perform: {
                                    movieDetailToShow = movie
                                })
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeContentView(homeViewModel: HomeViewModel(),
                    selectedTopRow: .home,
                    movieDetailToShow: .constant(nil))
}
