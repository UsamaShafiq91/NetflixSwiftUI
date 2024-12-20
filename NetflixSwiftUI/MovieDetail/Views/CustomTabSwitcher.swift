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
    
    @State private var selectedTab = Tab.episode
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(height: 6)
                                .foregroundStyle(tab == selectedTab ? Color.red : Color.clear)
                            
                            Button(action: {
                                withAnimation {
                                    selectedTab = tab
                                }
                            }, label: {
                                Text(tab.rawValue)
                                    .fontWeight(.bold)
                                    .foregroundStyle(tab == selectedTab ? Color.white : Color.gray)
                            })
                        }
                    }
                }
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        CustomTabSwitcher(tabs: [.episode, .trailers, .more])
    }
}
