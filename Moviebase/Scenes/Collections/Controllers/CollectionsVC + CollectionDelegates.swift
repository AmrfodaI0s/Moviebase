//
//  CollectionsVC + CollectionView.swift
//  Moviebase
//
//  Created by Eslam on 5/21/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

//import Foundation
extension CollectionVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if flag == 4 {
           return tvShowaResults?.count ?? 0
        } else if flag == 5 {
           return popularPeopleResults?.count ?? 0
        } else {
            return moviesResults?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.collectionsCell, for: indexPath) as! CollectionsCell
        if flag == 4 {
            Helper.displayImage(imageView: cell.iv, url: tvShowaResults?[indexPath.row].posterPath ?? "")
        } else if flag == 5 {
            Helper.displayImage(imageView: cell.iv, url: popularPeopleResults?[indexPath.row].profilePath ?? "")
        } else {
            Helper.displayImage(imageView: cell.iv, url: moviesResults?[indexPath.row].posterPath ?? "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        var count: Int?
        if flag == 4 {
            count = tvShowaResults?.count
        } else if flag == 5 {
            count = popularPeopleResults?.count
        }
        else {
            count = moviesResults?.count
        }
        if indexPath.row == count! - 1 {
            //getMoreDataX()
            getMore()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = moviesResults?[indexPath.row]
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.Storyboard.moviesDetailsVC) as! MoviesDetailsVC
        vc.movieDetails = selectedMovie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension CollectionVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (view.frame.size.width - 36) / 3
        //let h = view.frame.size.height
        return CGSize(width: w, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    }
}
