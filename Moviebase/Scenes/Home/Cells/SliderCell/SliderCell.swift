//
//  SliderCell.swift
//  Moviebase
//
//  Created by Eslam on 5/12/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImageCollection: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    var state  = 0
    var sliderImageSet = [#imageLiteral(resourceName: "ironman") , #imageLiteral(resourceName: "poster") , #imageLiteral(resourceName: "1767024") , #imageLiteral(resourceName: "1767147") , #imageLiteral(resourceName: "avengers")]

    override func awakeFromNib() {
        super.awakeFromNib()
        sliderImageCollection.dataSource = self
        sliderImageCollection.delegate = self
        sliderImageCollection.register(UINib(nibName: "SliderImageCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.sliderImageCell)
        
    }

}
extension SliderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderImageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.sliderImageCell, for: indexPath) as! SliderImageCell
        return cell
    }
}
extension SliderCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width, height: self.frame.size.height)
    }
}
