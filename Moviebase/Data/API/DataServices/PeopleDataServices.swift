//
//  PeopleDataServices.swift
//  Moviebase
//
//  Created by Eslam on 5/30/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
import Alamofire
class PeopleDataServices {
    
    class func getPopularPeople(page: Int = 1 ,completetion: @escaping (_ error: Error?,_ popularPeople: PopularPeople? , _ last_page: Int) -> () ){
        AF.request(URLs.PopularPeopleURL + String(page)).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(PopularPeople.self, from: response.data!)
                var lastPage = Int()
                
                if let totalPages = jsonDecoder.totalPages {
                    lastPage = totalPages
                }
                completetion(nil,jsonDecoder,lastPage)
            } catch {
                print(error)
            }
        }
    }
}
