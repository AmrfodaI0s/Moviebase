//
//  SliderCell + Services.swift
//  Moviebase
//
//  Created by Eslam on 5/16/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
extension GenreCell {
    
    func getTrendingMovies(){
           MovieServices.trendingMovies { (error, trendingMovies) in
            self.trendingMoviesResults = trendingMovies?.results
           }
       }
}
extension GenreCell {
    func setGenreCells(indexPath: IndexPath, cell: GenreImageCell) {
        switch indexPath.row {
        case 0:
             Helper.displayImage(imageView: cell.iv, url: self.trendingMoviesResults?[indexPath.row].posterPath ?? "")
             cell.MovieNameLabel.text = self.trendingMoviesResults?[indexPath.row].originalTitle
        default:
            return
        }
    }
   
}
