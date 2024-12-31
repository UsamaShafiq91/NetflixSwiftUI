//
//  MoviePreviewCell.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 31/12/2024.
//

import SwiftUI
import Kingfisher

struct MoviePreviewCell: View {
    
    let movie: Movie
    
    let colors: [Color] = [.indigo, .blue, .green, .yellow, .orange, .red, .cyan, .mint]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailUrl)
                .resizable()
                .scaledToFill()
                .clipShape(.circle)
                .overlay(content: {
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundStyle(colors.randomElement() ?? .red)
                })
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .frame(height: 75)
                .offset(y: -20)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    MoviePreviewCell(movie: exampleMovie1)
}
