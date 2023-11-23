//
//  YouTubeSearchResponse.swift
//  MovieDatabase
//
//  Created by Артур Олехно on 24/11/2023.
//

import Foundation

struct YouTubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
