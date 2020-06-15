//
//  MoviesDetailsVC + SliderCollection.swift
//  Moviebase
//
//  Created by Eslam on 5/27/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
extension ContentDetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieImages?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.detailsSlider, for: indexPath) as? SliderDetailsCell else { return UICollectionViewCell() }
        
        if let image = movieImages?[indexPath.row].filePath {
            Helper.displayImage(imageView: cell.iv, url: image)
        } else {
            cell.iv.image = #imageLiteral(resourceName: "image-placeholder")
        }
        
        return cell
    }
}
extension ContentDetailsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  view.frame.size.width, height: 240)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == sliderCollection {
            let index = Int(self.sliderCollection.contentOffset.x / self.sliderCollection.frame.width)
            self.pageControl.currentPage = index
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        state = indexPath.row
    }
}
extension ContentDetailsVC {
    
    func configurePageControl() {
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = .clear
        self.pageControl.pageIndicatorTintColor = .white
        self.pageControl.currentPageIndicatorTintColor = .yellow
    }
}
