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

let episode1 = Episode(name: "Beginning and Ending",
                       season: 1,
                       episodeNumber: 1, 
                       thumbnailImageUrl: "https://picsum.photos/300/102",
                       description: "Six months later after the disappearance",
                       length: 53,
                       videoUrl: exampleVideoURL)
let episode2 = Episode(name: "Dark matter",
                       season: 1,
                       episodeNumber: 2,
                       thumbnailImageUrl: "https://picsum.photos/300/103",
                       description: "Six months later after the disappearance",
                       length: 54,
                       videoUrl: exampleVideoURL)
let episode3 = Episode(name: "Ghosts",
                       season: 1,
                       episodeNumber: 3,
                       thumbnailImageUrl: "https://picsum.photos/300/104",
                       description: "Six months later after the disappearance",
                       length: 56,
                       videoUrl: exampleVideoURL)
let episode4 = Episode(name: "season 2-1",
                       season: 2,
                       episodeNumber: 1,
                       thumbnailImageUrl: "https://picsum.photos/300/105",
                       description: "Six months later after the disappearance",
                       length: 34,
                       videoUrl: exampleVideoURL)
let episode5 = Episode(name: "season 2-2",
                       season: 2,
                       episodeNumber: 2,
                       thumbnailImageUrl: "https://picsum.photos/300/106",
                       description: "Six months later after the disappearance",
                       length: 43,
                       videoUrl: exampleVideoURL)

let exampleEpisodes = [episode1, episode2, episode3, episode4, episode5]

let exampleMovie1 = Movie(id: UUID().uuidString, 
                          name: "Dark",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Dystopian", "Exciting", "Suspense", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "James Cameron",
                          cast: "Hoffman, Oliver, Jordis", 
                          episodes: exampleEpisodes,
                          moreLikeThis: [exampleMovie2, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6],
                          trailers: exampleTrailers, 
                          previewImageName: "ozark-preview",
                          previewVideoUrl: exampleVideoURL,
                          accentColor: .blue)
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
                          trailers: exampleTrailers,
                          previewImageName: "ozark-preview",
                          previewVideoUrl: exampleVideoURL,
                          accentColor: .red)
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
                          trailers: exampleTrailers,
                          previewImageName: "dark-preview",
                          previewVideoUrl: exampleVideoURL,
                          accentColor: .green)
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
                          trailers: exampleTrailers,
                          previewImageName: "dark-preview",
                          previewVideoUrl: exampleVideoURL)
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
                          trailers: exampleTrailers,
                          previewImageName: "travelers-preview",
                          previewVideoUrl: exampleVideoURL)
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
                          trailers: exampleTrailers,
                          previewImageName: "travelers-preview",
                          previewVideoUrl: exampleVideoURL)

let exampleMovies = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

let exampleEpisodeInfo = CurrentEpisodeInfo(episodeName: "Beginnings And Eddings",
                                            description: "Six months after the disappearences, the police form a task in 2052. Jonas learns that most of the winden perished in apolyctic event.",
                                            season: 2,
                                            episode: 1)
