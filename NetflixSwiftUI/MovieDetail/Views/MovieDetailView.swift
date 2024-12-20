//
//  HomeDetailView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 17/12/2024.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.title2)
                    })
                    .padding()
                }
                
                ScrollView {
                    VStack {
                        HomeMovieCellView(movie: movie)
                            .frame(width: UIScreen.main.bounds.width / 2.5)
                        
                        MovieInfoSubheadline(movie: movie)
                            .padding(.vertical, 10)
                        
                        if let promotionHeadline = movie.promotionHeadline {
                            Text(promotionHeadline)
                                .font(.headline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        
                        HorizontalButton(imageName: "play.fill",
                                         text: "Play",
                                         background: .red, 
                                         action: {
                            
                        })
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(movie.episodeInfoDisplay)
                                .bold()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            
                            Text(movie.episodeDescriptionDisplay)
                                .font(.subheadline)
                            
                            Text("Cast: \(movie.cast)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            Text("Creators: \(movie.creators)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        HStack(spacing: 60) {
                            VerticalButton(text: "My List",
                                           isOnImage: "checkmark",
                                           isOffImage: "plus",
                                           isOn: true,
                                           action: {
                                
                            })
                            
                            VerticalButton(text: "Rate",
                                           isOnImage: "hand.thumbsup.fill",
                                           isOffImage: "hand.thumbsup",
                                           isOn: false,
                                           action: {
                                
                            })
                            
                            VerticalButton(text: "Share",
                                           isOnImage: "square.and.arrow.up",
                                           isOffImage: "square.and.arrow.up",
                                           isOn: true,
                                           action: {
                                
                            })
                            
                            Spacer()
                        }
                        .padding()
                        
                        CustomTabSwitcher(tabs: [.episode, .trailers, .more], 
                                          movie: movie)
                    }
                    .padding()

                }
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    MovieDetailView(movie: exampleMovie1)
}
