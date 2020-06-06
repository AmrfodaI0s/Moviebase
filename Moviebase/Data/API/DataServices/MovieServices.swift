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
    static func getMoreMovies<T : Codable>(url: String,_ page: Int, completion: @escaping (_ error: Error?,_ result : T?) -> ()){
        AF.request(url + String(page)).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(T.self, from: response.data!)
                completion(nil, jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
}
