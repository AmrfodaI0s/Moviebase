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
        static let goCollectionVC = "goCollectionVC"
        static let collectionVC = "collectionVC"
        static let collectionsCell = "collectionsCell"
    }
    struct IBOutlets{
        static let moviesTypes = ["Popular","Now Playing","Upcoming", "Popular"]

    }
    enum ContentType: String {
       case movie = "MOVIES"
        case tvSeries = "TV SHOWS"
    }
}
