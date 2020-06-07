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
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.detailsSlider, for: indexPath) as? SliderDetailsCell else { return UICollectionViewCell() }
        return cell
    }
}
extension ContentDetailsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  view.frame.size.width, height: 240)
    }
}
