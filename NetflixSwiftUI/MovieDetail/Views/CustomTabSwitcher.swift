//
//  CustomTab.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 17/12/2024.
//

import SwiftUI

enum Tab: String {
    case episode = "EPISODES"
    case trailers = "TRAILORS & MORE"
    case more = "MORE LIKE THIS"

}

struct CustomTabSwitcher: View {
    
    var tabs: [Tab]
    let movie: Movie
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    @State private var selectedTab = Tab.episode
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Button(action: {
                                withAnimation {
                                    selectedTab = tab
                                }
                            }, label: {
                                Text(tab.rawValue)
                                    .fontWeight(.bold)
                                    .foregroundStyle(tab == selectedTab ? Color.white : Color.gray)
                                    .padding(.vertical, 10)
                            })
                            .overlay(alignment: .top, content: {
                                Rectangle()
                                    .frame(height: 6)
                                    .foregroundStyle(tab == selectedTab ? Color.red : Color.clear)
                            })
                        }
                    }
                }
                
            }
            .scrollIndicators(.hidden)
            
            
            switch selectedTab {
            case .episode:
                EpisodeView(episodes: movie.episodes ?? [],
                            showSeasonPicker: $showSeasonPicker,
                            selectedSeason: $selectedSeason)
            case .trailers:
                TrailersView(trailers: movie.trailers)
            case .more:
                MoreLikeThisView(movies: movie.moreLikeThis)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        CustomTabSwitcher(tabs: [.episode, .trailers, .more],
                          movie: exampleMovie1,
                          showSeasonPicker: .constant(false),
                          selectedSeason: .constant(1))
    }
}
