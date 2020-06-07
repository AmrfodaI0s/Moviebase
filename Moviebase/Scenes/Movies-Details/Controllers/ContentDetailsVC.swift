//
//  ContentDetailsVC.swift
//  Moviebase
//
//  Created by Eslam on 5/27/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
class ContentDetailsVC: BaseVC {
    var flag = 0
    var movieDetails: MoviesResult?
    var tvShowDetails: TVShowsResults? {
        didSet {
            flag = 1
    }}
    var actorDetails: PeopleResult? {
        didSet {
            flag = 2
    }}
    @IBOutlet weak var sliderCollection: UICollectionView! {
        didSet {
        sliderCollection.register(UINib(nibName: "SliderDetailsCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.detailsSlider)
    }}
    @IBOutlet weak var scrollView: UIScrollView!
    override func didLoded() {
        if flag == 0 {
        print(movieDetails!)
            title = movieDetails?.originalTitle
        } else if flag == 1 {
        print(tvShowDetails!)
            title = tvShowDetails?.originalName
        } else {
            print(actorDetails!)
            title = actorDetails?.name
        }
        self.shyNavBarManager.scrollView = scrollView
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
}

