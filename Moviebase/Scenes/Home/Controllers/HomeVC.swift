//
//  HomeVC.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//
import UIKit
import SwiftSpinner
class HomeVC: BaseVC {
    
    var trendingMovies: Movies?
    var popularMovies: Movies?
    var nowPlayingMovies: Movies?
    var upComingMovies: Movies?
    var popularTVShows: TVShows?
    
    @IBOutlet weak var SuperCollection: UICollectionView!
    
    lazy var profileImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = #imageLiteral(resourceName: "micro")
        return image
    }()
    override func didLoded(){
        SwiftSpinner.show("")
        getPopularMovies()
        getTrendingMovies()
        getNowPlayingMovies()
        getUpComingMovies()
        getPopularTVShows()
        SwiftSpinner.hide()
        setNavBarItems(show: true)
        SuperCollection.register(UINib.init(nibName: "GenreCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.genreCell)
        SuperCollection.register(UINib(nibName: "SliderCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.sliderCell)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        setNavBarItems(show: false)
    }
}

//MARK: - NavBar Settings
extension HomeVC {
    func addImageToNavBar() {
        guard let navBar = self.navigationController?.navigationBar
           else { return }
        //navBar.layer.opacity = 0
        navBar.setGradientBackground(colors: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7013324058), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7013324058), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5453499572), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.449620077), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25) ,#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15) ,#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05369755988),.clear], startPoint: .custom(point: CGPoint(x: 0.0, y: 0.2)), endPoint: .custom(point: CGPoint(x: 0, y: 0.9)))
        navBar.shadowImage = UIImage()
        navBar.addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -16),
            profileImage.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 0),
            profileImage.widthAnchor.constraint(equalToConstant: 48),
            profileImage.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    //MARK: - nav bar items
    func setNavBarItems(show : Bool){
       // if show {
        addImageToNavBar()
    //MARK: - Scrolling with shyNavBarManager
        self.shyNavBarManager.scrollView = SuperCollection
    //MARK: - Transparent Nav-Bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "kk", style: .plain, target: nil, action: nil)

        //leftButtons
        self.navigationController?.navigationBar.setGradientBackground(colors: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7013324058), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7013324058), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5453499572), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.449620077), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25) ,#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15) ,#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05369755988),.clear], startPoint: .custom(point: CGPoint(x: 0.0, y: 0.2)), endPoint: .custom(point: CGPoint(x: 0, y: 1)))
        let menuButton = UIButton(type: .system)
        menuButton.setImage(#imageLiteral(resourceName: "menu24").withRenderingMode(.alwaysOriginal), for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        menuButton.addTarget(self, action: #selector(presentMenu), for: .touchUpInside)
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(#imageLiteral(resourceName: "magnafire").withRenderingMode(.automatic), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        searchButton.addTarget(self, action: #selector(presentSearch), for: .touchUpInside)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButton), UIBarButtonItem(customView: searchButton)]

//        }
//        else {
//            //self.navigationController?.navigationBar.isTranslucent = false
//        }
    }
    @objc func presentMenu(){
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
    @objc func presentSearch(){
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
}
//MARK: - API GET Methods
extension HomeVC {
    //MARK: - fetch all popular Movies
    func getPopularMovies() {
        DispatchQueue.main.async {
            MovieServices.getPopularMovies { (error, popularMovies) in
                self.popularMovies = popularMovies
                self.SuperCollection.reloadData()
            }
        }
    }
    //MARK: - fetch all trending Movies
       func getTrendingMovies(){
        MovieServices.trendingMovies { (error, trendingMovies)  in
                   self.trendingMovies = trendingMovies
               }
       }
    //MARK: - fetch now Playing Movies
    func getNowPlayingMovies(){
            MovieServices.nowPlayingMovies(completion: { (error, moviesNowPlaying) in
                self.nowPlayingMovies = moviesNowPlaying
                self.SuperCollection.reloadData()
            })
    }
    //MARK: - fetch now Upcoming Movies
       func getUpComingMovies(){
               MovieServices.upComingMovies(completion: { (error, upComingMovies) in
                   self.upComingMovies = upComingMovies
                   self.SuperCollection.reloadData()
               })
       }
    //MARK: - fetch Popular TV-Shows
    func getPopularTVShows() {
        TVShowsServices.getPopularTVShows { (error, popularTVShows) in
            self.popularTVShows = popularTVShows
            self.SuperCollection.reloadData()
        }
    }

}
//MARK: - Movie Services
extension HomeVC {
    func setGenreCell(index: Int, cell: GenreCell) {
        let moviesCollections = [popularMovies, nowPlayingMovies, upComingMovies]
         let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.Storyboard.collectionVC) as! CollectionVC
        //destinationVC.modalPresentationStyle = .fullScreen
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        cell.selectedCollection = { self.navigationController?.pushViewController(destinationVC, animated: true) }
        switch index {
        case 1:
            cell.popularMovies = popularMovies?.results
            cell.genreType_label.text = K.ContentType.movie.rawValue
            cell.genreNameLabel.text = K.IBOutlets.moviesTypes[0]
            destinationVC.selectedCollection = moviesCollections[0]
            destinationVC.url = URLs.popularMovies
            cell.state = index
            
        case 2:
            cell.nowPlayingMovies = nowPlayingMovies?.results
            cell.genreType_label.text = K.ContentType.movie.rawValue
            cell.genreNameLabel.text = K.IBOutlets.moviesTypes[1]
            destinationVC.selectedCollection = moviesCollections[1]
            destinationVC.url = URLs.nowPlayingMovies
            cell.state = index

        case 3 :
            cell.upComingMovies = upComingMovies?.results
            cell.genreType_label.text = K.ContentType.movie.rawValue
            cell.genreNameLabel.text = K.IBOutlets.moviesTypes[2]
            destinationVC.selectedCollection = moviesCollections[2]
            destinationVC.url = URLs.upComingMovies
            cell.state = index

        case 4:
            cell.popularTVShows = popularTVShows?.results
            cell.genreType_label.text = K.ContentType.tvSeries.rawValue
            cell.genreNameLabel.text = K.IBOutlets.moviesTypes[3]
            cell.state = index
            

         default:
            return
        }
    }

}
/*
 logo image
 let logo = UIImage(named: "micro.png")
 let imageView = UIImageView(image:logo)
 imageView.contentMode = .scaleAspectFit
 imageView.superview?.alignmentRectInsets.right. = CGRect(x: 0, y: 0, width: 0, height: 0)
 self.navigationItem.titleView = imageView
 */ /*
 let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
 let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
 let blurEffectView = UIVisualEffectView(effect: blurEffect)
 blurEffectView.frame = navBar.bounds
 blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
 navBar.addSubview(blurEffectView)
 navBar.setBackgroundImage(UIImage(), for: .default)
 */
