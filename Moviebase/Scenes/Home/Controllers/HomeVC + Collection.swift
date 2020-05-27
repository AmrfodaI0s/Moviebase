//
//  HomeVC + SliderCollection.swift
//  Moviebase
//
//  Created by Eslam on 5/12/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
//MARK: - Collection DataSource
extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return K.IBOutlets.moviesTypes.count + 1
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0
               , left: 0, bottom: 0, right: 0)
       }
    func configureSliderCollection() {
      
    }
}
//MARK: - Collection Delegate
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = view.frame.size
        let height = screen.height
        let width = screen.width
        if indexPath.row == 0 {
            return CGSize(width: width, height: height - 200)
        } else if indexPath.row > 0 {
            return CGSize(width: width, height: 200 )
        }
        else {
            return CGSize(width: width, height: 200 )
        }
    }
    //MARK: - cell For Item At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.sliderCell, for: indexPath) as! SliderCell
            sliderCell.trendingMovies = self.trendingMovies?.results
            return sliderCell
        } else if indexPath.row > 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.genreCell, for: indexPath) as! GenreCell
            setGenreCell(index: indexPath.row, cell: cell)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
