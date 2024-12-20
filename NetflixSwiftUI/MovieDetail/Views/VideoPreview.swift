//
//  VideoPreview.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 20/12/2024.
//

import SwiftUI
import Kingfisher

struct VideoPreview: View {
    
    let imageUrl: URL
    let videoUrl: URL
    
    @State private var showVideoPlayer = false
    
    var body: some View {
        ZStack {
            KFImage(imageUrl)
                .resizable()
                .scaledToFill()
            
            Button(action: {
                showVideoPlayer = true
            }, label: {
                Image(systemName: "play.circle")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
            })
        }
        .sheet(isPresented: $showVideoPlayer, content: {
            CustomVideoPlayer(videoUrl: videoUrl)
        })
    }
}

#Preview {
    VideoPreview(imageUrl: exampleImageUrl,
                 videoUrl: exampleVideoURL)
}
