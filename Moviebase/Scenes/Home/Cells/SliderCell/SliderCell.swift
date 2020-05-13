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
        let _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(Slider_Timer), userInfo: nil, repeats: true)
        }
    @objc func Slider_Timer()  {
           if state < sliderImageSet.count {
               let index = IndexPath(item: state, section: 0)
               sliderImageCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
               state += 1
           } else {
               state = 0
               let index = IndexPath(item: state, section: 0)
               sliderImageCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
           }
       }
}
extension SliderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderImageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.sliderImageCell, for: indexPath) as! SliderImageCell
        cell.poster_iv.image = sliderImageSet[indexPath.row]
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == sliderImageCollection {
            let index = Int(self.sliderImageCollection.contentOffset.x / self.sliderImageCollection.frame.width)
            pageController.currentPage = index
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        state = indexPath.row
    }
}
extension SliderCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width, height: self.frame.size.height)
    }
    
}
