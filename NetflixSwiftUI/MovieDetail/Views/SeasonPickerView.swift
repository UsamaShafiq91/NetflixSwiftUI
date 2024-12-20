//
//  SeasonPickerView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 20/12/2024.
//

import SwiftUI

struct SeasonPickerView: View {
    let seasons: Int
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            ForEach(0..<seasons) { season in
                Button(action: {
                    selectedSeason = (season + 1)
                    showSeasonPicker = false
                }, label: {
                    Text("Season \(season + 1)")
                        .font((season + 1) == selectedSeason ? .title : .title2)
                        .foregroundStyle((season + 1) == selectedSeason ? Color.white : Color.gray)
                        .fontWeight(.bold)
                })
            }
            
            Spacer()
            
            Button(action: {
                showSeasonPicker = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
            })
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        SeasonPickerView(seasons: 3,
                         showSeasonPicker: .constant(true),
                         selectedSeason: .constant(1))
    }
}
