//
//  ComingSoonView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 30/12/2024.
//

import SwiftUI

struct ComingSoonView: View {
    
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil

    @ObservedObject var viewModel = ComingSoonViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        NotificationBar(showNotificationList: $showNotificationList)
                        
                        ForEach(viewModel.movies) {movie in
                            ComingSoonCell(movie: movie, movieDetailToShow: $movieDetailToShow)
                        }
                    }
                    .navigationDestination(isPresented: $showNotificationList, destination: {
                        Text("Notifications View")
                    })
                }
                .padding()
                
                if let movieDetailToShow = movieDetailToShow {
                    withAnimation(.easeIn, {
                        MovieDetailView(movie: movieDetailToShow,
                                        movieDetailToShow: $movieDetailToShow)
                    })
                }
            }
        }
    }
}

#Preview {
    ComingSoonView()
}
