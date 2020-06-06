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
        return results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.collectionsCell, for: indexPath) as! CollectionsCell
        Helper.displayImage(imageView: cell.iv, url: results?[indexPath.row].posterPath ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         let count = results?.count
            if indexPath.row == count! - 1 {
                getMoreData()
            }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = results?[indexPath.row]
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
        return UIEdgeInsets(top: 12
            , left: 8, bottom: 12, right: 8)
    }
}
