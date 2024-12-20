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
        CustomVideoPlayer(videoUrl: videoUrl)
    }
}

#Preview {
    CustomVideoPlayer(videoUrl: exampleVideoURL)
}
