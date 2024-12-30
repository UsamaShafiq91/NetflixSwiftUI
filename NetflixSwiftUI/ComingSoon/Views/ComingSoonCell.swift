//
//  ComingSoonCell.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 30/12/2024.
//

import SwiftUI
import Kingfisher

struct ComingSoonCell: View {
    
    let movie: Movie
    @Binding var movieDetailToShow: Movie?

    var body: some View {
        VStack {
            CustomVideoPlayer(videoUrl: exampleVideoURL)
                .frame(height: 200)
            
            VStack {
                HStack {
                    KFImage(movie.thumbnailUrl)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width / 3, height: 75)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        VStack(spacing: 4) {
                            Image(systemName: "bell")
                                .font(.title3)
                            
                            Text("Remind Me")
                                .font(.caption)
                        }
                    })
                    .padding(.horizontal)
                    
                    Button(action: {
                        movieDetailToShow = movie
                    }, label: {
                        VStack(spacing: 4) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            
                            Text("Info")
                                .font(.caption)
                        }
                    })
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading) {
                    Text(movie.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    
                    Text(movie.episodeDescriptionDisplay)
                        .foregroundStyle(.gray)
                }
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        ComingSoonCell(movie: exampleMovie1, 
                       movieDetailToShow: .constant(nil))
    }
}
