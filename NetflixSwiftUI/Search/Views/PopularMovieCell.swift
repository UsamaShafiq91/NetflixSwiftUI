//
//  PopularMovieCell.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 26/12/2024.
//

import SwiftUI
import Kingfisher

struct PopularMovieCell: View {
    
    let movie: Movie
    @Binding var movieDetailToShow: Movie?

    var body: some View {
        GeometryReader {geometry in
            HStack {
                KFImage(movie.thumbnailUrl)
                    .resizable()
                    .frame(width: geometry.size.width / 3)
                
                Text(movie.name)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrowtriangle.forward.fill")
                        .imageScale(.large)
                })
            }
            .onTapGesture {
                movieDetailToShow = movie
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        PopularMovieCell(movie: exampleMovie1, 
                         movieDetailToShow: .constant(nil))
    }
}
