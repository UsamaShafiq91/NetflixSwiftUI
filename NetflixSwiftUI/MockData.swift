//
//  MockData.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import Foundation

let exampleMovie1 = Movie(id: UUID().uuidString, 
                          name: "Dark",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"])
let exampleMovie2 = Movie(id: UUID().uuidString, 
                          name: "Travellers",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"])
let exampleMovie3 = Movie(id: UUID().uuidString, 
                          name: "Community",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"])
let exampleMovie4 = Movie(id: UUID().uuidString, 
                          name: "Alone",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"])
let exampleMovie5 = Movie(id: UUID().uuidString, 
                          name: "Hannibal",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"])
let exampleMovie6 = Movie(id: UUID().uuidString, 
                          name: "After Life",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"])

let exampleMovies = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
