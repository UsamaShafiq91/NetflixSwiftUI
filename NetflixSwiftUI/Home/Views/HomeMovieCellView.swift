//
//  HomeMovieCellView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import SwiftUI
import Kingfisher

struct HomeMovieCellView: View {
    
    let movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailUrl)
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    HomeMovieCellView(movie: exampleMovie1)
}
