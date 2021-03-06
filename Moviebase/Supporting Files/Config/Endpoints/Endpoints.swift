//
//  Endpoints.swift
//  Moviebase
//
//  Created by Eslam on 5/14/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation

class URLs {
    
    ///mark:- API_Key
    static let API_Key = "5d3fa758ba1c2690af9c4455aa75790e"
    static let baseURL = "https://api.themoviedb.org/3/"
    
    ///mark:- Popular People URL, takes 3 parameters(API_Key, Language, Page)
    static let popularPeopleURL = baseURL + "person/popular?api_key=" + URLs.API_Key + "&\(language)&page="
    
    ///mark:- Requesting image URL
    static let ImageRequestURL_w500 = "https://image.tmdb.org/t/p/w500"
    static let ImageRequestURL_original = "https://image.tmdb.org/t/p/original"
    static let ImageRequestURL_w1280 = "https://image.tmdb.org/t/p/w1280"
    ///mark:- Base URL for People details
    static let DetailBaseURL = baseURL + "person/"
    
    ///mark:- End URL for People details
    static let DetailEndURL = "?api_key=" + URLs.API_Key + "&\(language)"
    
    ///mark:- Base URL to getting all movies of the person by person ID
    static let MovieCreditsBaseURL = "\(baseURL)person/"
    
    ///mark:- End URL to getting all movies of the person by person ID
    static let MovieCreditsEndURL = "/movie_credits?api_key=" + URLs.API_Key + "&\(language)"
    
    ///mark:- Base URL to get all crews by movie ID
    static let MovieCrewBaseURL = baseURL + "movie/"
    
    ///mark:- End URL to get all crews by movie ID
    static let MovieCrewEndURL = "/credits?api_key=" + URLs.API_Key
    
    ///mark:- End URL to the language
    static let language = "language=en-US"
    
    ///mark:- Base URL for person query search
    static let SearchQueryBaseURL = baseURL+"search/person?api_key=" + URLs.API_Key + "&\(language)&query="
    
    ///mark:- Base URL for getting all Languages
    static let allLanguages = "\(baseURL)configuration/languages?api_key=\(API_Key)"
    
    ///mark:- Middle URL for person query search
    static let SearchQueryMiddleURL = "&page="
    
    ///mark:- End URL for person query search
    static let SearchQueryEndURL = "&include_adult=false"
    
    static let videoUrl = "https://www.themoviedb.org/video/play?key=P6AaSMfXHbA"
    
    static let popularMovies = MovieCrewBaseURL + "popular?api_key=\(API_Key)&\(language)&page="
    
    static let trendingMovies = baseURL + "trending/movie/week?api_key=" + API_Key + "&\(language)"
    
    static let nowPlayingMovies = MovieCrewBaseURL + "now_playing?api_key=\(API_Key)&\(language)&region=US&page="
    
    static let upComingMovies = MovieCrewBaseURL + "upcoming?api_key=\(API_Key)&\(language)&page="
    
    ///mark:- Get TV Show
    static let tvBaseUrl = "\(baseURL)tv/"
    
    static let popularTvShows = "\(tvBaseUrl)popular?api_key=\(API_Key)&\(language)&page="
    
    //static let movieImagesBase = "\(MovieCrewBaseURL)"
    static let movieImages = "/images?api_key=\(API_Key)&\(language)&include_image_language=en"
}
