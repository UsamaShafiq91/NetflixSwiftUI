//
//  PreviewListView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 31/12/2024.
//

import SwiftUI

struct PreviewListView: View {
    
    let movies: [Movie]
    
    @Binding var currentIndex: Int
    @Binding var isVisible: Bool
    
    @State private var translation: CGFloat = 0
    
    func shouldPlayVideo(index: Int) -> Bool {
        return (index == currentIndex && isVisible) ? true : false
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            PagerView(pageCount: movies.count,
                      currentIndex: $currentIndex,
                      translation: $translation,
                      content: {
                ForEach(0..<movies.count, content: {index in
                    let movie = movies[index]
                    
                    PreviewView(viewModel: PreviewViewModel(movie: movie),
                                playVideo: shouldPlayVideo(index: index), 
                                isVisible: $isVisible)
                    .frame(width: UIScreen.main.bounds.width)
                })
            })
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}

#Preview {
    PreviewListView(movies: exampleMovies,
                    currentIndex: .constant(0),
                    isVisible: .constant(true))
}
