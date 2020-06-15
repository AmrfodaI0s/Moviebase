//
//  MovieServices.swift
//  Moviebase
//
//  Created by Eslam on 5/15/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
import Alamofire

struct DataServices {
    static func GET<T: Codable>(url: String,_ page: Int, completion: @escaping (_ error: Error?,_ result : T?) -> ()){
        AF.request(url + String(page)).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(T.self, from: response.data!)
                completion(nil, jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
    static func getAllLanguages(completion: @escaping (_ error: Error?,_ language: [Language?])-> ()) {
        AF.request(URLs.allLanguages).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode([Language].self, from: response.data!)
                completion(nil,jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
    static func getMoviesImages(_ movieID: Int,completion: @escaping (_ error: Error?,_ MovieImage: MovieImage?)-> ()) {
        let url = URLs.MovieCrewBaseURL + String(movieID) + URLs.movieImages
        AF.request(url).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(MovieImage.self, from: response.data!)
                completion(nil,jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
}
