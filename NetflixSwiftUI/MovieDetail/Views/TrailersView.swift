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
                    VideoPreview(trailer: trailer)
                    
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
