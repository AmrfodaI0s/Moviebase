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

      static func getPopularMovies( completion: @escaping (_ error: Error?,_ popularMovies: PopularMovies? ) -> () ){
        AF.request(URLs.popularMovies).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(PopularMovies.self, from: response.data!)

                completion(nil,jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
    static func trendingMovies( completion: @escaping (_ error: Error?,_ trendingMovies: TrendingMovies? ) -> () ){
        print(URLs.trendingMovies)
           AF.request(URLs.trendingMovies).responseJSON { (response) in
               do {
                   let jsonDecoder = try JSONDecoder().decode(TrendingMovies.self, from: response.data!)

                   completion(nil,jsonDecoder)
               } catch {
                   print(error)
               }
           }
       }
}
