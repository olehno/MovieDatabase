import Foundation

struct Constants {
    
    struct API {
        static let apiKey = "916b3c8e529ebd01e1617dac39c36d35"
        
        static let popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        static let topRatedMoviesUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)"
        static let upcomingMoviesUrl = "https://api.themoviedb.org/3/movie/upcoming?&primary_release_date.gte=2023-05-26&api_key=\(apiKey)"
        
        static let posterUrl = "https://image.tmdb.org/t/p/w500/"
        static let trailerUrl = "https://www.youtube.com/watch?v="
        
        static let YouTubeAPI_KEY = "AIzaSyDz1GcbSgFuoBr4EXNDd7XKqByvF5C4H6Y"
        static let YouTubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search"
    }
    
    struct Icon {
        static let overview = "📝 "
        static let rating = "⭐ "
        static let releaseDate = "📅 "
        static let runtime = "🎬 "
    }
    
    struct Image {
        static let posterPlaceholder = "https://critics.io/img/movies/poster-placeholder.png"
    }
    
    struct MovieList {
        static let popular = "Popular Movies"
        static let topRated = "Top Rated Movies"
        static let upcoming = "Upcoming Movies"
    }
    
    struct RowHeight {
        static let homeTableViewCell = CGFloat(integerLiteral: 210)
        static let searchTableViewCell = CGFloat(integerLiteral: 210)
        static let watchlistTableViewCell = CGFloat(integerLiteral: 172)
    }
}
