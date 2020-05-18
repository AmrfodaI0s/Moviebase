//
//  Constants.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
struct K {
    struct Storyboard {
        static let sideMenuVC = "sideMenuVC"
        static let homeVC = "homeVC"
        static let sliderCell = "sliderCell"
        static let genreCell = "genreCell"
        static let sliderImageCell = "sliderImageCell"
        static let genreImageCell = "genreImageCell"
    }
    struct IBOutlets{
        static let trendingMovies = "Trending"

    }
    enum ContentType: String {
       case movie = "Movie"
        case tvSeries = "TV"
    }
}
