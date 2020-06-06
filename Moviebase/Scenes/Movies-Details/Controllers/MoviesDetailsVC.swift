//
//  MoviesDetailsVC.swift
//  Moviebase
//
//  Created by Eslam on 5/27/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
class MoviesDetailsVC: BaseVC {
    
    var movieDetails: Result?
    @IBOutlet weak var sliderCollection: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func didLoded() {
        print(movieDetails!)
        configCell()
        self.shyNavBarManager.scrollView = scrollView

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    
}

