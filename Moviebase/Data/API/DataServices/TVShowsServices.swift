//
//  TVShowsServices.swift
//  Moviebase
//
//  Created by Eslam on 5/20/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
import Alamofire

class TVShowsServices {
    static func getPopularTVShows( completion: @escaping (_ error: Error?,_ popularTVShows: TVShows? ) -> () ) {
           AF.request(URLs.popularTvShows).responseJSON { (response) in
               do {
                   let jsonDecoder = try JSONDecoder().decode(TVShows.self, from: response.data!)
                   completion(nil,jsonDecoder)
               } catch {
                   print(error)
               }
           }
       }
}
