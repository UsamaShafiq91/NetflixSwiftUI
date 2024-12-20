//
//  TopMoviePreview.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    let movie: Movie
    
    func isLastCategory(category: String) -> Bool {
        return movie.categories.last == category
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailUrl)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        Text(category)
                            .font(.footnote)
                        
                        if !isLastCategory(category: category) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 3))
                                .foregroundStyle(.blue)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    VerticalButton(text: "My List",
                                   isOnImage: "checkmark",
                                   isOffImage: "plus",
                                   isOn: true,
                                   action: {
                        
                    })
                    
                    Spacer()
                    HorizontalButton(imageName: "play.fill",
                                text: "Play",
                                action: {
                        
                    })
                    .frame(width: 120)
                    
                    Spacer()
                    VerticalButton(text: "Info",
                                   isOnImage: "info.circle",
                                   isOffImage: "info.circle",
                                   isOn: true,
                                   action: {
                        
                    })
                    
                    Spacer()
                }
            }
            .background(
                LinearGradient(colors: [.clear,
                    .black.opacity(0.95)],
                               startPoint: .top,
                               endPoint: .bottom)
                .padding(.top, 250)
            )
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    TopMoviePreview(movie: exampleMovie1)
}
