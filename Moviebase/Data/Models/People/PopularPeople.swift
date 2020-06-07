//
//  PopularPeople.swift
//  Moviebase
//
//  Created by Eslam on 5/30/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation

// MARK: - PopularPeople
struct PopularPeople: Codable {
    var page, totalPages: Int?
    var results: [PeopleResult]

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct PeopleResult: Codable {
   
   
    var knownForDepartment,name ,profilePath: String?
     var  id: Int?
    var knownFor: [KnownFor]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case profilePath = "profile_path"
        case knownFor = "known_for"
        case name
    }
}
// MARK: - KnownFor
struct KnownFor: Codable {
    var title: String?
    var id: Int?

}
