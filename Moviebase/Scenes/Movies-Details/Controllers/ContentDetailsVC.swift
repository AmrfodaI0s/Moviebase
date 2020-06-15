//
//  ContentDetailsVC.swift
//  Moviebase
//
//  Created by Eslam on 5/27/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class ContentDetailsVC: BaseVC {
    
    var pageControl : UIPageControl = UIPageControl(frame: CGRect(x: 136, y: 220, width: 200, height: 20))
    @IBOutlet weak var mainView: UIView!
    var movieImages: [Backdrop]? {
        didSet {
            guard let pagesCount = self.movieImages?.count else { return }
                print(pagesCount)
            self.pageControl.numberOfPages = pagesCount
            configurePageControl()

        }
    }
    lazy var profileImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = true
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: 24, y: 170, width: 88, height: 140)
        image.backgroundColor = .clear
        image.layer.shadowOffset = CGSize(width: 0, height: 6)
        image.layer.shadowOpacity = 0.5
        image.layer.shadowRadius = 5.0
        image.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return image
    }()
    var flag: Int?
    var state  = 0
    var index = 0
    var movieDetails: MoviesResult? {
        didSet {
            flag = 0
            getMovieImages()
        }
    }
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

           let _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(Slider_Timer), userInfo: nil, repeats: true)
            }
    }
    @objc func Slider_Timer()  {
        guard let imagesCount = self.movieImages?.count else { return }

        if state < imagesCount {
            let index = IndexPath(item: state, section: 0)
            sliderCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            state += 1
        } else {
            state = 0
            let index = IndexPath(item: state, section: 0)
            sliderCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!
    override func didLoded() {
        sliderCollection.register(UINib(nibName: "SliderDetailsCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.detailsSlider)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.mainView.addSubview(profileImage)
        self.mainView.addSubview(pageControl)
        configurePageControl()
        if flag == 0 {
            title = movieDetails?.originalTitle
            Helper.displayImage(imageView: profileImage, url: movieDetails?.posterPath)
        } else if flag == 1 {
            title = tvShowDetails?.originalName
            Helper.displayImage(imageView: profileImage, url: tvShowDetails?.posterPath)
        } else {
            title = actorDetails?.name
            Helper.displayImage(imageView: profileImage, url: actorDetails?.profilePath)
        }
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = true
    }
}
extension ContentDetailsVC {
    func getMovieImages() {
        Helper.Spinner(hidden: false, "Loading")
        print(movieDetails?.id ?? 0)
        DataServices.getMoviesImages(movieDetails?.id ?? 0) { (error, movieImages) in
            if let images = movieImages?.backdrops {
                if images.count > 0 {
                    self.movieImages = images
                    self.sliderCollection?.reloadData()
                } else {
                    if let images = movieImages?.posters {
                    self.movieImages = images
                    self.sliderCollection?.reloadData()
                    }
                }
            }
            Helper.Spinner(hidden: true, nil)
        }
    }
}

