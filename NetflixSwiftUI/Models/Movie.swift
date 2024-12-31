//
//  Movie.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailUrl: URL
    var categories: [String]
    var genre: HomeGenre = .allGenres
    
    // Movie Detail
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String

    var episodes: [Episode]?
    
    var promotionHeadline: String?
    
    var moreLikeThis: [Movie]
    var trailers: [Trailer]
    
    var previewImageName: String
    var previewVideoUrl: URL?
    
    var accentColor: Color = .white

    var numberOfSeasonsDisplay: String {
        var display = ""
        
        if let seasons = numberOfSeasons {
            display = seasons == 1 ? "1 Season" : "\(seasons) Seasons"
        }
        
        return display
    }
    
    var episodeInfoDisplay: String {
        var display = ""
        
        if let currentEpisode = currentEpisode {
            display = "S\(currentEpisode.season):E\(currentEpisode.episode) \(currentEpisode.episodeName)"
        }
        else {
            display = "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
        
        return display
    }
    
    var episodeDescriptionDisplay: String {
        var display = ""
        
        if let currentEpisode = currentEpisode {
            display = currentEpisode.description
        }
        else {
            display = defaultEpisodeInfo.description
        }
        
        return display
    }
    
    var movieType: MovieType {
        guard let episodesCount = episodes?.count, 
                episodesCount > 0 else {
            return .movie
        }
        
        return .tvShow
    }
}

enum MovieType {
    case movie
    case tvShow
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}
