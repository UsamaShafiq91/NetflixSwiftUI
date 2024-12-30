//
//  DownloadView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 30/12/2024.
//

import SwiftUI

struct DownloadView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Smart Downloads")
                    Text("ON")
                        .foregroundStyle(.blue)
                    
                    Spacer()
                }
                .padding()
                .bold()
                
                
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .foregroundStyle(Color.graySearchText)
                        
                        Image(systemName: "arrow.down.to.line")
                            .resizable()
                            .scaledToFit()
                            .padding(50)
                    }
                    .frame(height: 250)
                    .padding(.top, 75)
                    
                    Text("Never be without Netflix")
                        .font(.title)
                        .bold()
                    
                    Text("Download shows and movies")
                    
                    Button(action: {
                        
                    }, label: {
                        Text("See what can you download")
                            .foregroundStyle(.black)
                            .font(.title2)
                            .padding()
                            .background(.white)
                    })
                }
                
                Spacer()

            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    DownloadView()
}
