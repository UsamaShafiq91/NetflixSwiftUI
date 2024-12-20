//
//  MovieInfoSubheadline.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 17/12/2024.
//

import SwiftUI

struct MovieInfoSubheadline: View {
    
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            
            Image(systemName: "hand.thumbsup.fill")
                .foregroundStyle(.white)
            
            Text(String(movie.year))
            
            Text(movie.rating)
                .font(.caption)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .background(.gray)
            
            Text(movie.numberOfSeasonsDisplay)
            
            
            Spacer()
        }
        .foregroundStyle(.gray)
    }
}

#Preview {
    MovieInfoSubheadline(movie: exampleMovie3)
}
