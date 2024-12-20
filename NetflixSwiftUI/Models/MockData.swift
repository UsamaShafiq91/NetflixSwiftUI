//
//  MockData.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import Foundation

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!

let exampleImageUrl = URL(string: "https://picsum.photos/300/104")!
let exampleImageUrl2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageUrl3 = URL(string: "https://picsum.photos/300/106")!

var randomImageURL: URL {
    return [exampleImageUrl, exampleImageUrl2, exampleImageUrl3].randomElement() ?? exampleImageUrl
}

let trailer1 = Trailer(name: "Season 3 trailer", 
                       videoUrl: exampleVideoURL, 
                       thumbnailUrl: randomImageURL)
let trailer2 = Trailer(name: "The journet",
                       videoUrl: exampleVideoURL,
                       thumbnailUrl: randomImageURL)
let trailer3 = Trailer(name: "Avengers trailer",
                       videoUrl: exampleVideoURL,
                       thumbnailUrl: randomImageURL)

let exampleTrailers = [trailer1, trailer2, trailer3]

let exampleMovie1 = Movie(id: UUID().uuidString, 
                          name: "Dark",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis", 
                          moreLikeThis: [exampleMovie2, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6], 
                          trailers: exampleTrailers)
let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Travellers",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 2,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis",
                          moreLikeThis: [],
                          trailers: exampleTrailers)
let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Community",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis",
                          moreLikeThis: [],
                          trailers: exampleTrailers)
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
                          promotionHeadline: "Watch upcoming episodes",
                          moreLikeThis: [],
                          trailers: exampleTrailers)
let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Hannibal",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 5,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis",
                          moreLikeThis: [],
                          trailers: exampleTrailers)
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
                          promotionHeadline: "Watch Season 6 Now",
                          moreLikeThis: [],
                          trailers: exampleTrailers)

let exampleMovies = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

let exampleEpisodeInfo = CurrentEpisodeInfo(episodeName: "Beginnings And Eddings",
                                            description: "Six months after the disappearences, the police form a task in 2052. Jonas learns that most of the winden perished in apolyctic event.",
                                            season: 2,
                                            episode: 1)
