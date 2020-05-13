//
//  GenreCell.swift
//  Moviebase
//
//  Created by Eslam on 5/12/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class GenreCell: UICollectionViewCell {

    @IBOutlet weak var genreType_label: UILabel!
    @IBOutlet weak var genreNameLabel: UILabel!
    @IBOutlet weak var genreCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        genreCollection.dataSource = self
        genreCollection.delegate = self
        genreCollection.register(UINib(nibName: "GenreImageCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.genreImageCell)
    }

}
extension GenreCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Storyboard.genreImageCell, for: indexPath) as! GenreImageCell
        return cell
    }
    
}
extension GenreCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (self.frame.size.width - 100) / 3
        let h = genreCollection.frame.size.height
        return CGSize(width: w, height: h)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0
            , left: 12, bottom: 0, right: 12)
    }
    
}
