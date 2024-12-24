//
//  MoreLikeThisView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 20/12/2024.
//

import SwiftUI

struct MoreLikeThisView: View {
    
    let movies: [Movie]
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(movies, id:\.id) { movie in
                HomeMovieCellView(movie: movie)
            }
        }
    }
}

#Preview {
    MoreLikeThisView(movies: exampleMovies)
}
