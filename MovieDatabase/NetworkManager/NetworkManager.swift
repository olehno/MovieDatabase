//
//  NetworkManager.swift
//  MovieDatabase
//
//  Created by arturs.olekss on 22/11/2023.
//

import Foundation

enum APIError: Error {
    case failedToGetData
}

class NetworkManager {
    
    static let shared = NetworkManager()

    
    static func fetchMovies(url: String, completion: @escaping (Movies) -> () ) {
        
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { (data, response, err ) in
            
            guard err == nil else {
                print("Error: ", err!)
                return
            }
            
            guard let data = data else { return }
            
            
            do {
                let jsonData = try JSONDecoder().decode(Movies.self, from: data)
                completion(jsonData)
            }catch{
                print("Error: ", error)
            }
            
        }.resume()
    }//fetchMovies
    
    static func fetchMoviesByKeyword(keyword: String, completion: @escaping (Movies) -> () ) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(keyword)&api_key=\(Constants.API.apiKey)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { (data, response, err ) in
            
            guard err == nil else {
                print("Error: ", err!)
                return
            }
            
            guard let data = data else { return }
            
            
            do {
                let jsonData = try JSONDecoder().decode(Movies.self, from: data)
                completion(jsonData)
            }catch{
                print("Error: ", error)
            }
            
        }.resume()
    }//fetchMoviesByKeyword
    
    static func fetchMovieDetails(movieId: String, completion: @escaping (MovieDetails) -> () ) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(Constants.API.apiKey)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { (data, response, err ) in
            
            guard err == nil else {
                print("Error: ", err!)
                return
            }
            
            guard let data = data else { return }
            
            
            do {
                let jsonData = try JSONDecoder().decode(MovieDetails.self, from: data)
                completion(jsonData)
            }catch{
                print("Error: ", error)
            }
            
        }.resume()
    }//fetchMovieDetails
    
    static func fetchMovieTrailer(movieId: String, completion: @escaping (Trailers) -> () ) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=\(Constants.API.apiKey)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { (data, response, err ) in
            
            guard err == nil else {
                print("Error: ", err!)
                return
            }
            
            guard let data = data else { return }
            
            
            do {
                let jsonData = try JSONDecoder().decode(Trailers.self, from: data)
                completion(jsonData)
            }catch{
                print("Error: ", error)
            }
            
        }.resume()
    }//fetchMovieTrailer
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL (string: "\(Constants.API.YouTubeBaseURL)?q=\(query)&key=\(Constants.API.YouTubeAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(YouTubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

