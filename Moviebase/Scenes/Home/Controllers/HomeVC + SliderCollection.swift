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
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0
               , left: 0, bottom: 0, right: 0)
       }
    func configureSliderCollection() {
        SuperCollection.register(UINib(nibName: "SliderCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.sliderCell)
        SuperCollection.register(UINib(nibName: "GenreCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.genreCell)
    }
}
//MARK: - Collection Delegate
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = view.frame.size
        let height = screen.height
        let width = screen.width
        if indexPath.row == 0 {
            return CGSize(width: width, height: height - 150)
        } else {
            return CGSize(width: width, height: 200 )
        }
    }
   //MARK: - cell For Item At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let genreCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.genreCell, for: indexPath) as! GenreCell
                let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.sliderCell, for: indexPath) as! SliderCell
        if indexPath.row == 0 {
            return sliderCell
        } else {
            switch indexPath.row {
            case 1 :
                genreCell.genreNameLabel.text = "Trending"
                genreCell.genreType_label.text = K.ContentType.movie.rawValue
                return genreCell
            case 2 :
                genreCell.genreNameLabel.text = "Popular"
                genreCell.genreType_label.text = K.ContentType.tvSeries.rawValue
                return genreCell
            default:
                return genreCell
            }
        }
    }
}
