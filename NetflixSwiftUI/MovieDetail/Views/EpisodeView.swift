//
//  EpisodeView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 20/12/2024.
//

import SwiftUI
import Kingfisher

struct EpisodeView: View {
    
    let episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func getEpisodesFor(season: Int) -> [Episode] {
        return episodes.filter({$0.season == selectedSeason})
    }

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Text("Season \(selectedSeason)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Image(systemName: "chevron.down")
                })
                
                Spacer()
            }
            
            VStack {
                ForEach(getEpisodesFor(season: selectedSeason)) { episode in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            VideoPreview(imageUrl: episode.thumbnailUrl,
                                         videoUrl: episode.videoUrl)
                            .frame(width: 120, height: 70)
                            .clipped()

                                
                            VStack(alignment: .leading) {
                                Text("\(episode.episodeNumber). \(episode.name)")
                                Text("\(episode.length) mins")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "arrow.down.to.line")
                                .font(.system(size: 14))
                        }
                        
                        Text(episode.description)
                            .font(.callout)
                            .lineLimit(3)
                        
                    }
                }
            }
            .padding()

            
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        EpisodeView(episodes: exampleEpisodes,
                    showSeasonPicker: .constant(false),
                    selectedSeason: .constant(1))
    }
}
