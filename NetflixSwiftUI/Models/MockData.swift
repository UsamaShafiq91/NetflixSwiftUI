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
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis")
let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Travellers",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 2,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis")
let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Community",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis")
let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Alone",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 4,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis",
                          promotionHeadline: "Watch upcoming episodes")
let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Hannibal",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 5,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis")
let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "After Life",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 6,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis", 
                          promotionHeadline: "Watch Season 6 Now")

let exampleMovies = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

let exampleEpisodeInfo = CurrentEpisodeInfo(episodeName: "Beginnings And Eddings",
                                            description: "Six months after the disappearences, the police form a task in 2052. Jonas learns that most of the winden perished in apolyctic event.",
                                            season: 2,
                                            episode: 1)
