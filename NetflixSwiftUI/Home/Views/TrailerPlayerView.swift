//
//  TrailerPlayerView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 31/12/2024.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    let videoUrl: URL?
    @Binding var playVideo: Bool
    
    var body: some View {
        if let videoUrl = videoUrl {
            VideoPlayer(url: videoUrl,
                        play: $playVideo)
        }
        else {
            Text("Unable to load video")
                .bold()
        }
    }
}

#Preview {
    TrailerPlayerView(videoUrl: nil, 
                      playVideo: .constant(false))
}
