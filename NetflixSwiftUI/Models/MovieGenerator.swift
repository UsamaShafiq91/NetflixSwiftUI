//
//  MovieGenerator.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 26/12/2024.
//

import Foundation

func generateMovies(count: Int) -> [Movie] {
    guard count > 0 else { return [] }
    
    var allMovies: [Movie] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        let name = generateRandomMovieName()
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")!
        
        let year = Int.random(in: 2000...2024)
        let rating = generateRandomMovieRating()
        
        let cast = "\(generateRandomCastName()), \(generateRandomCastName()), \(generateRandomCastName())"
        let creators = "\(generateRandomDirectorName()), \(generateRandomDirectorName())"
        let categories = [generateRandomMovieCategory(), generateRandomMovieCategory(), generateRandomMovieCategory()]
        
        let headline = "Watch Now!"
        
        let numSeasons = Int.random(in: 1...3)
        
        var allEpisodes: [Episode] = []
        
        for i in 1...numSeasons {
            allEpisodes.append(contentsOf: generateEpisode(5, season: i))
        }
        
        let episodeName = generateRandomTVEpisodeName()
        let episodeDescription = generateRandomTVEpisodeDescription()
        let episodeInfo = CurrentEpisodeInfo(episodeName: episodeName,
                                             description: episodeDescription,
                                             season: 1,
                                             episode: 1)
        
        let allTrailers = generateTrailers(3)
        let moreLikeThis = exampleMovies
        
        let previewImageName = ["dark-preview", "ozark-preview", "travelers-preview", ""].randomElement() ?? ""
        var previewVideoUrl: URL?
        
        if !previewImageName.isEmpty {
            previewVideoUrl = exampleVideoURL
        }
        
        let movie = Movie(id: id,
                          name: name,
                          thumbnailUrl: thumbnail,
                          categories: categories,
                          genre: .allGenres,
                          year: year,
                          rating: rating,
                          numberOfSeasons: numSeasons,
                          currentEpisode: episodeInfo,
                          defaultEpisodeInfo: episodeInfo,
                          creators: creators,
                          cast: cast,
                          episodes: allEpisodes,
                          promotionHeadline: headline,
                          moreLikeThis: moreLikeThis,
                          trailers: allTrailers, 
                          previewImageName: previewImageName,
                          previewVideoUrl: previewVideoUrl)
        
        allMovies.append(movie)
    }
    
    return allMovies
}

func generateRandomMovieRating() -> String {
    // List of common movie ratings
    let movieRatings = [
        "G",      // General Audience
        "PG",     // Parental Guidance
        "PG-13",  // Parents Strongly Cautioned
        "TV-G",   // General Audience (TV)
        "TV-PG",  // Parental Guidance Suggested (TV)
        "TV-14",  // Parents Strongly Cautioned (TV)
        "Unrated" // Unrated
    ]
    
    // Randomly pick an index in the array
    let randomIndex = Int.random(in: 0..<movieRatings.count)
    
    // Return the rating at that index
    return movieRatings[randomIndex]
}

func generateRandomTVEpisodeDescription() -> String {
    // List of generic TV episode descriptions
    let episodeDescriptions = [
        "A tense confrontation takes place between two main characters as secrets are revealed, threatening their relationship.",
        "The team uncovers a dark conspiracy that leads them to a dangerous confrontation with the villain they least expect.",
        "The protagonist faces a moral dilemma that could change the course of their future, testing their resolve like never before.",
        "In a thrilling twist, a long-lost family member unexpectedly returns, complicating the already complicated situation.",
        "The group embarks on an unexpected adventure, uncovering clues that could unlock the mystery behind a long-forgotten event.",
        "A shocking betrayal rocks the team, leaving them fractured and uncertain of who they can trust moving forward.",
        "As the characters delve deeper into the mystery, they uncover truths that challenge everything they thought they knew.",
        "The episode takes an emotional turn as a key character must confront their past, leading to a moment of personal growth.",
        "In a race against time, the heroes must stop a catastrophic event from unfolding, facing dangers that test their endurance and courage.",
        "A dangerous encounter forces the group to split up, each facing their own challenges and discoveries.",
        "A lighthearted episode where the characters find themselves in comedic situations, breaking the tension from previous dramatic events.",
        "The protagonist must confront a major loss and reflect on what it means for their future and the future of the people around them.",
        "A stunning cliffhanger that leaves the audience on the edge of their seat, questioning what happens next for the main characters.",
        "A flashback episode reveals key details about the backstory of a secondary character, shedding new light on their motivations.",
        "A game-changing revelation comes to light, forcing the characters to make difficult decisions that could alter the course of the series.",
        "The characters face an ethical dilemma that brings them to a crossroads, forcing them to make a decision that could affect their future.",
        "An unexpected ally comes to the forefront, offering help that may change the direction of the story, but not without a price.",
        "The group faces a moral quandary, forcing them to decide whether to follow the rules or bend them for the greater good.",
        "An epic showdown between the main characters and their greatest adversary, where the stakes have never been higher.",
        "A major plot twist occurs when the antagonist reveals their true intentions, sending the characters into a spiral of confusion and fear.",
        "A quiet, introspective episode that focuses on character development and the internal struggles faced by one or more of the protagonists.",
        "The stakes reach a boiling point as the characters' loyalty is tested, with each choice leading to devastating consequences.",
        "The heroes are forced to make a daring escape from a perilous situation, with unexpected twists and turns keeping them on edge.",
        "In a high-stakes mission, the group works together to infiltrate the enemy’s base, with all their skills put to the test.",
        "In the aftermath of a devastating event, the characters are left to pick up the pieces and deal with the emotional fallout.",
        "An intense episode where alliances shift, and the true nature of the conflict becomes clear, leaving the characters facing an uncertain future.",
        "The tension between two characters comes to a head in a dramatic confrontation that has lasting consequences for everyone involved.",
        "A long-awaited reunion occurs, but it is marred by hidden agendas and unspoken truths that threaten to destroy the moment.",
        "The group is forced to go undercover in a dangerous setting, leading to unexpected risks and thrilling moments of suspense.",
        "In a heartwarming episode, characters band together to support one another during a time of personal crisis, reinforcing the power of friendship.",
        "A new threat emerges, and the characters must band together to confront it, knowing that not everyone will make it out unscathed.",
        "The episode explores the personal lives of the main characters as they try to balance their duties with their relationships.",
        "An event from the past resurfaces, forcing the characters to reckon with the decisions they made years ago and their long-term consequences.",
        "A comedic misunderstanding leads to a series of humorous events that lighten the mood, but reveal deeper truths about the characters involved.",
        "In a tragic turn, a beloved character makes the ultimate sacrifice to save others, leaving the group to carry on without them.",
        "A sudden shift in power dynamics leads to a dramatic transformation in the main characters’ roles within the group.",
        "A pivotal episode in the series where the stakes are raised significantly, forcing everyone to make tough choices that will shape their destinies.",
        "The series takes a darker turn as the group faces an unforeseen disaster that challenges their resilience and survival instincts.",
        "The episode explores the concept of redemption as a character seeks to make amends for past mistakes, but at a personal cost."
    ]
    
    // Randomly pick an index in the array
    let randomIndex = Int.random(in: 0..<episodeDescriptions.count)
    
    // Return the episode description at that index
    return episodeDescriptions[randomIndex]
}

func generateRandomTVEpisodeName() -> String {
    // List of TV series episode names (sample titles)
    let episodeNames = [
        "The One with the Prom Video", "The Pilot", "The Iron Throne", "The One Where Everybody Finds Out",
        "The Rains of Castamere", "The Day Will Come When You Won't Be", "The Last Dance",
        "The Reichenbach Fall", "The Winds of Winter", "The One Where Ross Got High",
        "Game of Thrones - The Battle of the Bastards", "The One with Ross's Sandwich",
        "The Prince of Winterfell", "The Final Countdown", "The Breaking Point",
        "The Night King", "The One with All the Resolutions", "The Red Wedding",
        "The Final Episode", "The Reunion", "The Journey Begins", "The One with Ross's Wedding",
        "The End of the Line", "The Return of the Jedi", "The Lifting", "The Broken Crown",
        "The End of the World", "The Last Supper", "The Unfinished Business", "The Memory Lane",
        "The First Step", "The Way Forward", "The Escape", "The Final Showdown",
        "The Beginning of the End", "The Queen's Gambit", "The Death of the Doctor",
        "The Labyrinth", "The Catcher in the Rye", "The Road to Redemption", "The Climax",
        "The Twist", "The Lost Episode", "The Long Night", "The Final Hour",
        "The Crossover Event", "The Rebirth", "The Calm Before the Storm", "The Wild Hunt",
        "The Awakening", "The Last Hope", "The Endgame", "The Fall", "The Phoenix Rises",
        "The Last Goodbye", "The Day After Tomorrow", "The King's Speech",
        "The Final Countdown", "The Immortal", "The Last Wish", "The Hidden Truth",
        "The Hidden City", "The Betrayal", "The Silent Witness", "The Phoenix", "The Chosen One",
        "The Real Deal", "The End of the Beginning", "The Awakening of Magic",
        "The Reconnection", "The New World", "The Final Cut", "The Last Chance",
        "The Coming Storm", "The Rise of the Dragon", "The Outcast", "The Tipping Point",
        "The Final Battle", "The Mystery Unraveled", "The Quiet Before the Storm",
        "The New Era", "The Fallout", "The Truth Revealed", "The Burning Path",
        "The Forgotten Secrets", "The Last Chapter", "The Unraveling", "The End of an Era",
        "The Secret Behind the Mask", "The Moment of Truth", "The Storm Before the Calm",
        "The Final Push", "The Last Stand", "The Final Countdown", "The Turning Point",
        "The Unseen Hand", "The Great Escape", "The Last Letter", "The Unpredictable",
        "The Final Hour", "The Reckoning", "The Deep End", "The End of the Line",
        "The Road to Nowhere", "The Secret Path", "The Long Road Home", "The Cold Case",
        "The Comeback", "The Unexpected", "The Last Resort", "The Final Decision",
        "The Last Trial", "The Devil's Playground", "The Road to Victory", "The Turning Tide",
        "The Lurking Danger", "The Heart of Darkness", "The Unspoken Word", "The Longest Night",
        "The Final Curtain", "The Last Day", "The Final Test", "The Edge of Tomorrow",
        "The Time Has Come", "The Ultimate Showdown", "The Next Generation", "The Dark Secrets",
        "The Last of Us", "The Final Countdown", "The Hidden Agenda", "The Master Plan"
    ]
    
    // Randomly pick an index in the array
    let randomIndex = Int.random(in: 0..<episodeNames.count)
    
    // Return the episode name at that index
    return episodeNames[randomIndex]
}

func generateRandomMovieName() -> String {
    // List of 200 movie titles
    let movieTitles = [
        "The Shawshank Redemption", "The Godfather", "The Dark Knight", "Pulp Fiction", "Forrest Gump",
        "Inception", "The Matrix", "Fight Club", "The Lord of the Rings: The Fellowship of the Ring",
        "Interstellar", "The Lion King", "The Avengers", "Gladiator", "Titanic", "The Godfather: Part II",
        "The Silence of the Lambs", "Schindler's List", "The Green Mile", "The Prestige", "The Departed",
        "Whiplash", "The Pianist", "The Usual Suspects", "Goodfellas", "Se7en", "The Intouchables",
        "Parasite", "The Wolf of Wall Street", "Django Unchained", "The Shining", "Back to the Future",
        "Star Wars: Episode V - The Empire Strikes Back", "Casablanca", "The Great Gatsby",
        "The Social Network", "The Grand Budapest Hotel", "A Clockwork Orange", "2001: A Space Odyssey",
        "Citizen Kane", "The Dark Knight Rises", "The Lion King", "Gladiator", "Schindler's List",
        "Memento", "The Revenant", "American History X", "Taxi Driver", "Blade Runner", "The Departed",
        "The Truman Show", "Inglourious Basterds", "The Prestige", "Léon: The Professional", "Coco",
        "Finding Nemo", "The Hateful Eight", "Her", "The Matrix Reloaded", "Avengers: Endgame",
        "The Good, the Bad and the Ugly", "The Big Lebowski", "Saving Private Ryan", "The Big Short",
        "The Dark Knight", "A Beautiful Mind", "The Godfather: Part III", "Star Wars: Episode IV - A New Hope",
        "The Wizard of Oz", "The Incredibles", "Deadpool", "Mad Max: Fury Road", "The Sound of Music",
        "Star Wars: Episode VI - Return of the Jedi", "Toy Story", "The Bridge on the River Kwai",
        "Jaws", "The Maltese Falcon", "The Silence of the Lambs", "The Hunt for Red October",
        "Dr. Strangelove", "The Princess Bride", "The Godfather", "Shutter Island", "The Great Escape",
        "Rocky", "The Shining", "The Evil Dead", "The Bourne Identity", "Joker", "The Exorcist",
        "The Chronicles of Narnia: The Lion, the Witch and the Wardrobe", "The Road", "The Nightmare Before Christmas",
        "Inglourious Basterds", "Trainspotting", "The Iron Giant", "The Terminator", "A Beautiful Mind",
        "The Secret Life of Walter Mitty", "The King's Speech", "The Fighter", "12 Years a Slave",
        "The Big Lebowski", "Good Will Hunting", "Raging Bull", "The Deer Hunter", "The Hurt Locker",
        "The Texas Chain Saw Massacre", "Fargo", "The Wizard of Oz", "The Godfather: Part II", "Oldboy",
        "The Princess Bride", "Moonlight", "Requiem for a Dream", "Stand by Me", "The Others", "The Killing",
        "The Phantom of the Opera", "Scarface", "The Shawshank Redemption", "Dune", "Scarface",
        "A Nightmare on Elm Street", "No Country for Old Men", "The Revenant", "Goodfellas", "Casino",
        "There Will Be Blood", "The Departed", "The Dark Knight", "The Social Network", "The Martian",
        "The Matrix Revolutions", "The Great Dictator", "The Shining", "La La Land", "The Wizard of Oz",
        "The Sixth Sense", "Gone with the Wind", "Casablanca", "The Great Escape", "Life Is Beautiful",
        "Once Upon a Time in Hollywood", "The Revenant", "The Pursuit of Happyness", "The Prestige",
        "The King's Speech", "The Bucket List", "The Blind Side", "Lalaland", "The Imitation Game",
        "Eternal Sunshine of the Spotless Mind", "The Hunger Games", "Scream", "The Exorcist", "The Departed",
        "The Incredibles", "Tangled", "The Lion King", "The Fellowship of the Ring", "Jurassic Park",
        "The Godfather Part II", "Star Wars: Episode I - The Phantom Menace", "The Grand Budapest Hotel",
        "The Hurt Locker", "The Dark Knight", "The Conjuring", "The Prestige", "The Lion King",
        "The Revenant", "The Good, the Bad, and the Ugly", "Coco", "Parasite", "Whiplash",
        "The Social Network", "The Matrix", "The Great Gatsby", "Eternal Sunshine of the Spotless Mind",
        "A Beautiful Mind", "American Beauty", "The Big Lebowski", "The Avengers", "Django Unchained",
        "Avatar", "The Big Short", "12 Years a Slave", "The Dark Knight Rises", "The Godfather",
        "Pulp Fiction", "The Lord of the Rings: The Return of the King", "Citizen Kane", "The Wolf of Wall Street",
        "The Departed", "The Martian", "Goodfellas", "The Princess Bride", "Stand by Me", "Fargo"
    ]
    
    // Randomly pick an index in the array
    let randomIndex = Int.random(in: 0..<movieTitles.count)
    
    // Return the movie title at that index
    return movieTitles[randomIndex]
}

func generateRandomCastName() -> String {
    let firstNames = ["James", "Emily", "Michael", "Sophia", "Daniel", "Olivia", "William", "Isabella", "Ethan", "Ava"]
    let lastNames = ["Smith", "Johnson", "Brown", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin"]

    let randomFirstName = firstNames.randomElement() ?? "John"
    let randomLastName = lastNames.randomElement() ?? "Doe"

    return "\(randomFirstName) \(randomLastName)"
}

func generateRandomDirectorName() -> String {
    // List of famous movie directors
    let directorNames = [
        "Steven Spielberg", "Martin Scorsese", "Quentin Tarantino", "Christopher Nolan", "Alfred Hitchcock",
        "Stanley Kubrick", "Ridley Scott", "James Cameron", "Francis Ford Coppola", "Woody Allen",
        "David Fincher", "James Cameron", "Tim Burton", "Peter Jackson", "Coen Brothers",
        "Christopher Nolan", "George Lucas", "Martin Scorsese", "Ridley Scott", "Zack Snyder",
        "Jean-Pierre Jeunet", "Wes Anderson", "Sofia Coppola", "David Lynch", "J.J. Abrams",
        "Paul Thomas Anderson", "Guillermo del Toro", "Ang Lee", "Spike Lee", "Robert Zemeckis",
        "Joel Coen", "Ethan Coen", "Kathryn Bigelow", "David O. Russell", "Ryan Coogler", "Greta Gerwig",
        "Hayao Miyazaki", "John Carpenter", "Michael Bay", "Ridley Scott", "Luc Besson", "Danny Boyle",
        "Danny DeVito", "Ron Howard", "John Hughes", "Richard Linklater", "Ron Howard", "James Wan",
        "Michael Mann", "Christopher McQuarrie", "Mel Gibson", "Peter Weir", "Richard Curtis",
        "Cameron Crowe", "Terry Gilliam", "Barry Jenkins", "Darren Aronofsky", "Lana Wachowski",
        "Lilly Wachowski", "M. Night Shyamalan", "John Ford", "Sam Mendes", "Rob Reiner", "Frank Darabont",
        "John Landis", "Ben Affleck", "Robert Rodriguez", "Clint Eastwood", "Martin Campbell",
        "Ridley Scott", "Joe Wright", "Tom Hooper", "Mike Nichols", "Jodie Foster", "Greta Gerwig",
        "James Gunn", "John Woo", "Walter Hill", "David Ayer", "Kenji Mizoguchi", "László Nemes",
        "James Marsh", "Rainer Werner Fassbinder", "Terrence Malick", "Oliver Stone", "Hayao Miyazaki",
        "John Singleton", "Jack Clayton", "Steven Soderbergh", "Darren Aronofsky", "Edgar Wright",
        "Guy Ritchie", "Richard Kelly", "Luc Besson", "John Woo", "Alexander Payne", "Frank Capra",
        "Steven Soderbergh", "David Fincher", "Milos Forman", "Roger Corman", "Wim Wenders",
        "P.T. Anderson", "Oliver Hirschbiegel", "Milos Forman", "Jean-Luc Godard", "Jim Jarmusch",
        "Federico Fellini", "Michel Gondry", "Pier Paolo Pasolini", "James Ivory", "Patty Jenkins",
        "David Lynch", "Wong Kar-wai", "Robert Altman", "Ken Loach", "Wong Kar-wai", "Yasujiro Ozu",
        "Krzysztof Kieslowski", "Akira Kurosawa", "Wim Wenders", "Ingmar Bergman", "Bong Joon-ho"
    ]
    
    // Randomly pick an index in the array
    let randomIndex = Int.random(in: 0..<directorNames.count)
    
    // Return the director name at that index
    return directorNames[randomIndex]
}

func generateRandomMovieCategory() -> String {
    // List of common movie categories (genres)
    let movieCategories = [
        "Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Fantasy", "Horror",
        "Mystery", "Romance", "Science Fiction", "Thriller", "Documentary", "Musical", "Family",
        "History", "War", "Western", "Biography", "Sport", "Film-Noir", "Music", "Adventure Comedy",
        "Action Thriller", "Romantic Comedy", "Historical Drama", "Psychological Thriller",
        "Superhero", "Cyberpunk", "Disaster", "Espionage", "Suspense", "Coming-of-Age",
        "Satire", "Black Comedy", "Zombie", "Gore", "Found Footage", "Survival", "Period Drama",
        "Slasher", "Mockumentary", "Road Movie", "Experimental", "Romantic Drama", "Fantasy Drama",
        "Dark Comedy", "Neo-Noir", "Action Comedy", "Action Drama", "Spy", "Action Sci-Fi",
        "Science Fiction Thriller", "Historical Fiction", "Political Thriller", "Anime", "Creature Feature",
        "Heist", "Gangster", "Biker Movie", "Sports Drama", "Martial Arts", "War Comedy",
        "Monster Movie", "Film Noir", "Psychological Drama", "Art House", "Cult", "Teen", "Classic",
        "Romantic Fantasy", "Musical Comedy", "Post-Apocalyptic", "Time Travel", "Alien Invasion",
        "Steampunk", "Historical Romance", "Surreal", "Parody", "Disaster Comedy", "Fictional Biography",
        "Supernatural", "Dark Fantasy", "Sci-Fi Comedy", "Action Adventure", "Historical Thriller",
        "War Drama", "Period Piece", "Fantasy Action", "Fantasy Adventure", "Romantic Thriller",
        "Mind-bender", "Magical Realism", "Space Opera", "Alien", "Spy Thriller", "Vampire",
        "Monster", "Cult Classic", "Pulp", "Silent Film", "Terror", "Gothic", "Psychological Horror",
        "Superhero Comedy", "Epic", "Surreal Drama", "Disaster Thriller", "Martial Arts Action",
        "Mock Action", "Puppet Animation", "Animated Fantasy", "Adventure Horror", "Historical Mystery",
        "Science Fiction Adventure", "Technological Thriller", "Romantic Sci-Fi", "Retro", "Postmodern",
        "Teen Drama", "Indie", "Low-budget", "Short Film", "Black-and-White", "Experimental Drama",
        "Indie Comedy", "Period Horror", "Period Mystery", "Neo-Classical", "Art Film", "Science Fiction Horror"
    ]
    
    // Randomly pick an index in the array
    let randomIndex = Int.random(in: 0..<movieCategories.count)
    
    // Return the movie category at that index
    return movieCategories[randomIndex]
}

func generateEpisode(_ count: Int, season: Int) -> [Episode] {
    var allEpisodes: [Episode] = []
    
    for i in 0..<count {
        let id = UUID().uuidString
        
        let episodeName = generateRandomTVEpisodeName()
        let episodeDescription = generateRandomTVEpisodeDescription()
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = "https://picsum.photos/300/10\(randThumbnail)"
        
        let episodeLength = Int.random(in: 20..<59)
        
        let episode = Episode(id: id,
                              name: episodeName,
                              season: season,
                              episodeNumber: i+1,
                              thumbnailImageUrl: thumbnail,
                              description: episodeDescription,
                              length: episodeLength,
                              videoUrl: exampleVideoURL)
    }
    
    return allEpisodes
}

func generateTrailers(_ count: Int) -> [Trailer] {
    var allTrailers: [Trailer] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        
        let name = generateRandomMovieTrailerName()
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")!
        
        let trailer = Trailer(id: id,
                              name: name,
                              videoUrl: exampleVideoURL,
                              thumbnailUrl: thumbnail)
    }
    
    return allTrailers
}

func generateRandomMovieTrailerName() -> String {
    // List of movie trailer names (sample)
    let trailerNames = [
        "The Last Stand", "A New Beginning", "Into the Unknown", "Rise of the Fallen", "Endgame: The Final Battle",
        "The Final Hour", "Betrayal of the Gods", "The Ultimate Showdown", "Fury of the Storm", "Beyond the Horizon",
        "Dark Secrets Unveiled", "The Reckoning", "Uncharted Territory", "The Final Countdown", "Whispers in the Dark",
        "Shadows of the Past", "Unstoppable Force", "Warriors of Destiny", "Redemption Road", "Twilight of the Empire",
        "The Path of Glory", "Revenge is a Dish", "Echoes of Tomorrow", "Blood and Honor", "The Power Within",
        "Chasing Eternity", "Fear the Night", "Rise of the Phoenix", "Twilight Chronicles", "Escape from Reality",
        "The Awakening", "Dawn of the Heroes", "Into the Abyss", "Lost in Time", "The Hidden Truth",
        "Journey into Darkness", "The Call of the Wild", "Mysterious Ways", "Beneath the Surface", "The Storm Breaks",
        "The War Within", "The Road Less Traveled", "A Heart Divided", "The Final Frontier", "The Edge of Tomorrow",
        "The Return of the King", "Heroes in the Shadows", "The Last Horizon", "The Watchers", "The Phoenix Rises",
        "Unmasking the Enemy", "The Forgotten Realm", "Breaking Point", "The Rise of Legends", "Fates Collide",
        "The Last Hope", "Into the Fire", "Chasing the Dream", "The Hidden World", "Warrior's End",
        "Echoes of the Past", "Silent Assassin", "City of Lies", "The Dark Kingdom", "Wicked Games",
        "Secrets of the Empire", "Into the Firestorm", "Unbreakable", "Into the Wild", "Tides of War",
        "The Reckoning Begins", "Through the Fire", "Heart of a Hero", "The Fallen Kingdom", "Shadows of the Future",
        "No Turning Back", "The Legacy of War", "A World Unseen", "Edge of the Abyss", "Whispers of the Unknown"
    ]
    
    // Randomly pick an index in the array
    let randomIndex = Int.random(in: 0..<trailerNames.count)
    
    // Return the trailer name at that index
    return trailerNames[randomIndex]
}


func randomString(length: Int) -> String {
    return ""
}
