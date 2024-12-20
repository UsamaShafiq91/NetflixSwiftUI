//
//  Episode.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 17/12/2024.
//

import Foundation

struct Episode: Identifiable {
    
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailImageUrl: String
    var description: String
    var length: Int
    
    var thumbnailUrl: URL {
        return URL(string: thumbnailImageUrl)!
    }
}
