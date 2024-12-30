//
//  SearchResultView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 30/12/2024.
//

import SwiftUI

struct SearchResultView: View {
    
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?

    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Movies & TV")
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
                 
            GeometryReader { geometry in
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(movies) { movie in
                        HomeMovieCellView(movie: movie)
                            .frame(width: (geometry.size.width / 3) - 10,height: 160)
                            .clipped()
                            .onTapGesture {
                                movieDetailToShow = movie
                            }
                        
                        
                    }
                }
            }
        }
        .padding()
        .foregroundStyle(.white)
    }
    
    
}

#Preview {
        SearchResultView(movies: generateMovies(count: 21),
                         movieDetailToShow: .constant(nil))
}
