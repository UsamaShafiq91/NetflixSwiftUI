//
//  MoviePreviewRow.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 31/12/2024.
//

import SwiftUI

struct MoviePreviewRow: View {
    
    let movies: [Movie]
    @Binding var currentIndex: Int
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Previews")
                .font(.title3)
                .bold()
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<movies.count) { i in
                        let movie = movies[i]
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                currentIndex = i
                                isVisible = true
                            }
                    }
                }
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    MoviePreviewRow(movies: exampleMovies,
                    currentIndex: .constant(0),
                    isVisible: .constant(false))
}
