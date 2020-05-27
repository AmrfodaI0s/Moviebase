//
//  MovieServices.swift
//  Moviebase
//
//  Created by Eslam on 5/15/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
import Alamofire

struct MovieServices {
    static func getMoreMovies(url: String,_ page: Int, completion: @escaping (_ error: Error?,_ movies: Movies?,_  lastPage: Int) -> () ){
        
        AF.request(url + String(page)).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(Movies.self, from: response.data!)
             var lastPage = Int()
             if let totalPages = jsonDecoder.totalPages {
                    lastPage = totalPages
             }
                completion(nil, jsonDecoder, lastPage)
            } catch {
                print(error)
            }
        }
    }
    static func getPopularMovies( completion: @escaping (_ error: Error?,_ popularMovies: Movies? ) -> () ){
        AF.request(URLs.popularMovies).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(Movies.self, from: response.data!)
                completion(nil,jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
    static func trendingMovies( completion: @escaping (_ error: Error?,_ trendingMovies: Movies?) -> () ){
           AF.request(URLs.trendingMovies).responseJSON { (response) in
               do {
                   let jsonDecoder = try JSONDecoder().decode(Movies.self, from: response.data!)
                   completion(nil, jsonDecoder)
               } catch {
                   print(error)
               }
           }
       }
    static func nowPlayingMovies( completion: @escaping (_ error: Error?,_ nowPlayingMovies: Movies?) -> () ){
        AF.request(URLs.nowPlayingMovies).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(Movies.self, from: response.data!)
                completion(nil,jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
    static func upComingMovies( completion: @escaping (_ error: Error?,_ upComingMovies: Movies? ) -> () ){
        AF.request(URLs.upComingMovies).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(Movies.self, from: response.data!)
                completion(nil,jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
}
