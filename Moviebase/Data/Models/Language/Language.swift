//
//  Language.swift
//  Moviebase
//
//  Created by Eslam on 6/12/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case tr = "tr"
    case zh = "zh"
    case es = "es"
    case th = "th"
    case it = "it"
    case pt = "pt"
    case de = "de"
    case aa = "aa"
    case af = "af"
    case ak = "ak"
    case an = "an"
    case aas = "as"
    case av = "av"
    case ae = "ae"
    case ay = "ay"
    case az = "az"
    case ba = "ba"
    case bm = "bm"
    case bi = "bi"
}

// MARK: - MovieImageElement
struct Language: Codable {
    let iso639_1, englishName, name: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case englishName = "english_name"
        case name
    }
}
