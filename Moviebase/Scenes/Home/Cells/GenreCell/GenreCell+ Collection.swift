//
//  GenreCell+ Collection.swift
//  Moviebase
//
//  Created by Eslam on 6/7/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
extension GenreCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch state {
        case 1: return popularMovies?.count ?? 0
        case 2 : return nowPlayingMovies?.count ?? 0
        case 3 : return upComingMovies?.count ?? 0
        case 4 : return popularTVShows?.count ?? 0
        case 5 : return popularPeople?.count ?? 0
        default :
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.genreImageCell, for: indexPath) as! GenreImageCell
        let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.popularPeopleCell, for: indexPath) as! PopularPeopleCell
        switch state {
        case 1:
            Helper.displayImage(imageView: cell.iv, url: self.popularMovies?[indexPath.row].posterPath)
            cell.movieRatingLabel.text = String(describing: popularMovies?[indexPath.row].voteAverage ?? 0.0)
            return cell
        case 2:
            Helper.displayImage(imageView: cell.iv, url: self.nowPlayingMovies?[indexPath.row].posterPath)
            cell.movieRatingLabel.text = String(describing: nowPlayingMovies?[indexPath.row].voteAverage ?? 0.0)
            return cell
        case 3:
            Helper.displayImage(imageView: cell.iv, url: self.upComingMovies?[indexPath.row].posterPath)
            cell.movieRatingLabel.text = String(describing: upComingMovies?[indexPath.row].voteAverage ?? 0.0)
            return cell
        case 4:
            Helper.displayImage(imageView: cell.iv, url: self.popularTVShows?[indexPath.row].posterPath)
            cell.movieRatingLabel.text = String(describing: popularTVShows?[indexPath.row].voteAverage ?? 0.0)
            return cell
        case 5:
            //topConstraint.constant = -30
            Helper.displayImage(imageView: popularCell.iv, url: self.popularPeople?[indexPath.row].profilePath)
            popularCell.personNameLabel.text = self.popularPeople?[indexPath.row].name
           return popularCell
        default:
            return UICollectionViewCell()
        }
    }
    //MARK: - did select item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch state {
        case 1 : selectedMovie?(popularMovies?[indexPath.row])
        case 2 : selectedMovie?(nowPlayingMovies?[indexPath.row])
        case 3 : selectedMovie?(upComingMovies?[indexPath.row])
        case 4 : selectedTVShow?(popularTVShows?[indexPath.row])
        case 5 : selectedActor?(popularPeople?[indexPath.row])
        default :
            return
        }
    }
}
extension GenreCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (self.frame.size.width - 100) / 3
        let h = genreCollection.frame.size.height
        if state == 5 {
            return CGSize(width: w, height: 116)
        } else {
        return CGSize(width: w, height: h)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0
            , left: 12, bottom: 0, right: 12)
    }
    
}
