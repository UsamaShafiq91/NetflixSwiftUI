//
//  VideoPlayer.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 20/12/2024.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: View {
    
    let videoUrl: URL
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: videoUrl))
    }
}

#Preview {
    CustomVideoPlayer(videoUrl: exampleVideoURL)
}
