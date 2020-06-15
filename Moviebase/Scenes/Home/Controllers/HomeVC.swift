//
//  HomeVC.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//
import UIKit
class HomeVC: BaseVC {
    var index = 0
    var trendingMovies: Movies?
    var popularMovies: Movies?
    var nowPlayingMovies: Movies?
    var upComingMovies: Movies?
    var popularTVShows: TVShows?
    var popularPeople: PopularPeople?
    var movieClosure: (()-> Movies?)?
    
    @IBOutlet weak var SuperCollection: UICollectionView! {
        didSet {
            SuperCollection.register(UINib.init(nibName: "GenreCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.genreCell)
            SuperCollection.register(UINib(nibName: "SliderCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.sliderCell)
        }
    }
    lazy var profileImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = #imageLiteral(resourceName: "cameraman")
        return image
    }()
    override func didLoded(){
        self.navigationController?.hidesBarsOnSwipe = true
        getDataServices()
        setNavBarItems(show: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        profileImage.alpha = 1
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        profileImage.alpha = 0
        self.navigationController?.navigationBar.tintColor = .yellow
        
    }
}

//MARK: - API GET Methods
extension HomeVC {
    func getDataServices(){
        DispatchQueue.main.async {
            Helper.Spinner(hidden: false, "Loading")
            DataServices.GET(url: URLs.trendingMovies, 1) { (error, trendingMovies: Movies?) in
                self.trendingMovies = trendingMovies
                self.SuperCollection.reloadData()
//                self.movieClosure = {
//                    return self.trendingMovies
//                }
            }
            DataServices.GET(url: URLs.popularMovies, 1) { (error, popularMovies: Movies?) in
                self.popularMovies = popularMovies
            }
            DataServices.GET(url: URLs.upComingMovies, 1) { (error, upComingMovies: Movies?) in
                self.upComingMovies = upComingMovies
                //self.SuperCollection.reloadData()
            }
            DataServices.GET(url: URLs.nowPlayingMovies, 1) { (error, nowPlayingMovies: Movies?) in
                self.nowPlayingMovies = nowPlayingMovies
                //self.SuperCollection.reloadData()
            }
            DataServices.GET(url: URLs.popularTvShows, 1) { (error, popularTVShows: TVShows?) in
                self.popularTVShows = popularTVShows
                //self.SuperCollection.reloadData()
            }
            DataServices.GET(url: URLs.popularPeopleURL, 1) { (error, popularPeople: PopularPeople?) in
                self.popularPeople = popularPeople
                self.SuperCollection.reloadData()
            }
            Helper.Spinner(hidden: true, nil)
        }
    }
    
}
//MARK: - Set Genre Cell
extension HomeVC {
    func setGenreCell(index: Int, cell: GenreCell) {
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        let moviesCollections = [popularMovies, nowPlayingMovies, upComingMovies]
        let tvShowsCollections = [popularTVShows]
        
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.Storyboard.collectionVC) as! CollectionVC
        
        let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.Storyboard.moviesDetailsVC) as! ContentDetailsVC
        
        cell.selectedCollection = { self.navigationController?.pushViewController(destinationVC, animated: true) }
        
        switch index {
        case 1:
            cell.popularMovies = popularMovies?.results
            cell.genreType_label.text = K.ContentType.movie.rawValue
            cell.genreNameLabel.text = K.IBOutlets.contentTypes[0]
            destinationVC.selectedMoviesCollection = moviesCollections[0]
            destinationVC.url = URLs.popularMovies
            cell.state = index
            destinationVC.title = K.IBOutlets.contentTypes[0] + " Movies"
            cell.selectedMovie =  { [weak self] selected in
            detailsVC.movieDetails = selected
                self?.navigationController?.pushViewController(detailsVC, animated: true)
            }
        case 2:
            cell.nowPlayingMovies = nowPlayingMovies?.results
            cell.genreType_label.text = K.ContentType.movie.rawValue
            cell.genreNameLabel.text = K.IBOutlets.contentTypes[1]
            destinationVC.selectedMoviesCollection = moviesCollections[1]
            destinationVC.title = K.IBOutlets.contentTypes[1] + " Movies"
            destinationVC.url = URLs.nowPlayingMovies
            cell.state = index
            cell.selectedMovie =  { [weak self] selected in
                detailsVC.movieDetails = selected
                self?.navigationController?.pushViewController(detailsVC, animated: true)
            }
        case 3 :
            cell.upComingMovies = upComingMovies?.results
            cell.genreType_label.text = K.ContentType.movie.rawValue
            cell.genreNameLabel.text = K.IBOutlets.contentTypes[2]
            destinationVC.selectedMoviesCollection = moviesCollections[2]
            destinationVC.url = URLs.upComingMovies
            destinationVC.title = K.IBOutlets.contentTypes[2] + " Movies"
            cell.state = index
            cell.selectedMovie =  { [weak self] selected in
                detailsVC.movieDetails = selected
                self?.navigationController?.pushViewController(detailsVC, animated: true)
            }
        case 4:
            cell.popularTVShows = popularTVShows?.results
            cell.genreType_label.text = K.ContentType.tvSeries.rawValue
            cell.genreNameLabel.text = K.IBOutlets.contentTypes[3]
            destinationVC.selectedTVShowsCollection = tvShowsCollections[0]
            destinationVC.url = URLs.popularTvShows
            cell.state = index
            destinationVC.flag = index
            destinationVC.title = K.IBOutlets.contentTypes[3] + " TV Shows"
            cell.selectedTVShow =  { [weak self] selected in
                detailsVC.tvShowDetails = selected
                self?.navigationController?.pushViewController(detailsVC, animated: true)
            }
        case 5:
            cell.popularPeople = popularPeople?.results
            cell.genreNameLabel.text = K.IBOutlets.contentTypes[4]
            destinationVC.url = URLs.popularPeopleURL
            destinationVC.selectedPeopleCollection = popularPeople
            destinationVC.flag = index
            destinationVC.title = K.IBOutlets.contentTypes[4]
            cell.state = index
            cell.selectedActor =  { [weak self] selected in
                detailsVC.actorDetails = selected
                self?.navigationController?.pushViewController(detailsVC, animated: true)
            }
            
        default:
            return
        }
    }
}
//MARK: - HomeVC + Navigation Bar
extension HomeVC {
    //MARK: - nav bar items
    func addImageToNavBar(with navBar: UINavigationBar) {
        
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
    func setNavBarItems(show : Bool){
        guard let navBar = self.navigationController?.navigationBar
        else { return }
        addImageToNavBar(with: navBar)
        //MARK: - Scrolling with shyNavBarManager
        //self.shyNavBarManager.scrollView = SuperCollection
        //MARK: - Transparent Nav-Bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .black
        
        //leftButtons
        navBar.setGradientBackground(colors: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7013324058), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7013324058), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5453499572), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.449620077), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25) ,#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15) ,#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05369755988),.clear], startPoint: .custom(point: CGPoint(x: 0.0, y: 0.2)), endPoint: .custom(point: CGPoint(x: 0, y: 1)))
        let menuButton = UIButton(type: .system)
        menuButton.setImage(#imageLiteral(resourceName: "menu24").withRenderingMode(.alwaysOriginal), for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        menuButton.addTarget(self, action: #selector(presentMenu), for: .touchUpInside)
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(#imageLiteral(resourceName: "magnafire").withRenderingMode(.automatic), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        searchButton.addTarget(self, action: #selector(presentSearch), for: .touchUpInside)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButton), UIBarButtonItem(customView: searchButton)]
        
    }
    @objc func presentMenu(){
//        let vc = SideMenuVC()
//        vc.trendingMovies = self.trendingMovies?.results
//        vc.flag = 1
//        //vc.reloadData()
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
    @objc func presentSearch(){
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
}
