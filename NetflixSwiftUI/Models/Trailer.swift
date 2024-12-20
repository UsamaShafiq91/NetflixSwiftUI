//
//  Trailer.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 20/12/2024.
//

import Foundation

struct Trailer: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var videoUrl: URL
    var thumbnailUrl: URL
}
