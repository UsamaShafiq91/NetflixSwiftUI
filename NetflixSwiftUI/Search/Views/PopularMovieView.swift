//
//  PopularView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 26/12/2024.
//

import SwiftUI

struct PopularMovieView: View {
    
    let movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Movies")
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
            
            LazyVStack(alignment: .leading, spacing: 8) {
                ForEach(movies) { movie in
                    PopularMovieCell(movie: movie,
                                     movieDetailToShow: $movieDetailToShow)
                    .frame(height: 75)
                }
            }
        }
        .padding()
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        PopularMovieView(movies: exampleMovies,
                    movieDetailToShow: .constant(nil))
    }
}
