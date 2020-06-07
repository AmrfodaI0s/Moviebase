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
            menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: K.Storyboard.menuCell)
            menuTableView.rowHeight = 48
        }
    }
    let transform = CGAffineTransform.identity
//    let images: [UIImage] = [#imageLiteral(resourceName: "movies"),#imageLiteral(resourceName: "movies"),#imageLiteral(resourceName: "series"),#imageLiteral(resourceName: "play"),#imageLiteral(resourceName: "group14"),#imageLiteral(resourceName: "profile"),#imageLiteral(resourceName: "magnafire")]
    let images = ["home","movies","series","play","group14","profile","magnafire"]
    let labels = ["Home",
                  "Popular Movies",
                  "Now Playing Movies",
                  "Upcoming Movies",
                  "Popular TV-Shows",
                  "Popular People",
                  "Search"]
    override func didLoded() {
        self.iv.transform = transform.rotated(by: 180 * CGFloat(Double.pi))
        self.iv.transform = transform.rotated(by: -1 * CGFloat(Double.pi))
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
             return .lightContent
       }
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        sideMenuViewController?.hideMenuViewController()
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
}
extension SideMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
