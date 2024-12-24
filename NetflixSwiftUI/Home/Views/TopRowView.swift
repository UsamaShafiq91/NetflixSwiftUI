//
//  TopRowView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 24/12/2024.
//

import SwiftUI

struct TopRowView: View {
    
    @Binding var selectedTopRow: HomeTopRow
    @Binding var selectedGenre: HomeGenre
    
    @Binding var showTopRowPicker: Bool
    @Binding var showGenrePicker: Bool

    var body: some View {
        switch selectedTopRow {
        case .home:
            HStack {
                Button(action: {
                    selectedTopRow = .home
                }, label: {
                    Image("netflix_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(.plain)
                
                Spacer()
                Button(action: {
                    selectedTopRow = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(.plain)
                
                Spacer()
                Button(action: {
                    selectedTopRow = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(.plain)

                Spacer()
                Button(action: {
                    selectedTopRow = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(.plain)
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .movies, .tvShows, .myList:
            HStack {
                Button(action: {
                    selectedTopRow = .home
                }, label: {
                    Image("netflix_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(.plain)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowPicker = true
                    }, label: {
                        Text(selectedTopRow.rawValue)
                            .font(.system(size: 18))
                        
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(180))
                            .font(.system(size: 9))
                    })
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        showGenrePicker = true
                    }, label: {
                        Text(selectedGenre.rawValue)
                            .font(.system(size: 14))
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(180))
                            .font(.system(size: 7))
                    })
                    .buttonStyle(.plain)
                    
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        }
        
    }
}

#Preview {
    TopRowView(selectedTopRow: .constant(.home),
               selectedGenre: .constant(.allGenres),
               showTopRowPicker: .constant(false), 
               showGenrePicker:.constant(false))
}
