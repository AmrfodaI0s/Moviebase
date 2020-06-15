//
//  MovieImage.swift
//  Moviebase
//
//  Created by Eslam on 6/12/20.
//  Copyright © 2020 Eslam. All rights reserved.
//
import Foundation

// MARK: - MovieImage
struct MovieImage: Codable {
    let id: Int
    let backdrops, posters: [Backdrop]
}

// MARK: - Backdrop
struct Backdrop: Codable {
    let aspectRatio: Double?
    let filePath: String?
    let height: Int?
    let iso639_1: ISO639_1?
    let voteAverage: Double?
    let voteCount, width: Int?

    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
        case height
        case iso639_1 = "iso_639_1"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case width
    }
}

enum ISO639_1: String, Codable {
    case en = "en"
}
