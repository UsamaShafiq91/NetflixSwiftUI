//
//  TrailersView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 20/12/2024.
//

import SwiftUI

struct TrailersView: View {
    
    let trailers: [Trailer]
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreview(imageUrl: trailer.thumbnailUrl,
                                 videoUrl: trailer.videoUrl)
                    
                    Text(trailer.name)
                        .font(.headline)
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    TrailersView(trailers: exampleTrailers)
}
