//
//  SideMenuVC.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class SideMenuVC: BaseVC {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var menuTableView: UITableView! {
        didSet {
            menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: K.Storyboard.menuCell)
            menuTableView.rowHeight = 48
        }
    }
    var result : [MoviesResult]? = []
    var flag: Int?
    var observer = 1
    var trendingMovies: [MoviesResult]? {
        didSet {
            result = trendingMovies
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        self.navigationController?.navigationBar.tintColor = .yellow
        
    }
    var popularMovies: Movies?
    let transform = CGAffineTransform.identity
    let images = ["home","movies","series","play","group14","profile","magnafire"]
    let labels = ["Home",
                  "Popular Movies",
                  "Now Playing Movies",
                  "Upcoming Movies",
                  "Popular TV-Shows",
                  "Popular People",
                  "Search"]
    
    override func didLoded() {
    }
    func reloadData() {
        
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        sideMenuViewController?.hideMenuViewController()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.iv.transform = transform.rotated(by: 180 * CGFloat(Double.pi))
        self.iv.transform = transform.rotated(by: -1 * CGFloat(Double.pi))
    }

}
extension SideMenuVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.Storyboard.menuCell, for: indexPath) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        cell.iv.image = UIImage(named:images[indexPath.row] )
        cell.genreTypeLabel.text = labels[indexPath.row]
        return cell
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension SideMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.Storyboard.collectionVC) as! CollectionVC
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        vc.contentID = 90
        vc.viewDidLoad()
        sideMenuViewController?.hideMenuViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
//    func selectedCell(index: Int, cell: UITableViewCell) {
//        switch index {
//        case 1:
//
//        default:
//
//        }
//    }

    
}
