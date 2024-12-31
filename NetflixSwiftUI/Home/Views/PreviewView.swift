//
//  PreviewView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 31/12/2024.
//

import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var viewModel: PreviewViewModel
    var playVideo: Bool
    @Binding var isVisible: Bool

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            TrailerPlayerView(videoUrl: viewModel.movie.trailers.first?.videoUrl,
                              playVideo: .constant(playVideo))
            
            VStack {
                HStack {
                    Text(viewModel.movie.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(viewModel.movie.accentColor)
                        
                    Spacer()
                    Button(action: {
                        isVisible = false
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 25))
                    })
                }
                .padding()

                Spacer()
                HStack {
                    ForEach(0..<viewModel.movie.categories.count) {i in
                        let category = viewModel.movie.categories[i]
                        
                        Text(category)
                            .font(.caption)
                            .foregroundStyle(viewModel.movie.accentColor)
                        
                        if i < (viewModel.movie.categories.count - 1) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .foregroundStyle(viewModel.movie.accentColor)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    VerticalButton(text: "My List",
                                   isOnImage: "checkmark",
                                   isOffImage: "plus",
                                   isOn: true,
                                   color: viewModel.movie.accentColor,
                                   action: {
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .border(viewModel.movie.accentColor, width: 2)
                    })
                    
                    Spacer()
                    
                    VerticalButton(text: "Info",
                                   isOnImage: "info.circle",
                                   isOffImage: "info.circle",
                                   isOn: true,
                                   color: viewModel.movie.accentColor,
                                   action: {
                        
                    })
                    
                    Spacer()
                }
                .padding(.top, 16)
            }
            .foregroundStyle(viewModel.movie.accentColor)
        }
    }
}

#Preview {
    PreviewView(viewModel: PreviewViewModel(movie: exampleMovie1), 
                playVideo: true,
                isVisible: .constant(true))
}
