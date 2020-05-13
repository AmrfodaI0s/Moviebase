//
//  HomeVC.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
class HomeVC: BaseVC {
    
    @IBOutlet weak var SuperCollection: UICollectionView!
    
    var lastContentOffset: CGFloat = 0

    lazy var profileImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = #imageLiteral(resourceName: "micro")
        
        return image
    }()
    
    override func didLoded(){
        navigationController?.hidesBarsOnSwipe = true
        setNavBarItems()
        configureSliderCollection()
    }
}
extension HomeVC {
    func addImageToNavBar() {
        guard let navBar = self.navigationController?.navigationBar
           else { return }
        navBar.shadowImage = UIImage()
        navBar.addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -16),
            profileImage.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 0),
            profileImage.widthAnchor.constraint(equalToConstant: 48),
            profileImage.heightAnchor.constraint(equalToConstant: 48)
        ])
        /*
         let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
         let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
         let blurEffectView = UIVisualEffectView(effect: blurEffect)
         blurEffectView.frame = navBar.bounds
         blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         navBar.addSubview(blurEffectView)
         navBar.setBackgroundImage(UIImage(), for: .default)
         */
    }
    //MARK: - nav bar items
    func setNavBarItems(){
        addImageToNavBar()
        //leftButtons
        let menuButton = UIButton(type: .system)
        menuButton.setImage(#imageLiteral(resourceName: "menu24").withRenderingMode(.alwaysOriginal), for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        menuButton.addTarget(self, action: #selector(presentMenu), for: .touchUpInside)
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(#imageLiteral(resourceName: "magnafire").withRenderingMode(.automatic), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        searchButton.addTarget(self, action: #selector(presentSearch), for: .touchUpInside)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButton), UIBarButtonItem(customView: searchButton)]
/*
 logo image
 let logo = UIImage(named: "micro.png")
 let imageView = UIImageView(image:logo)
 imageView.contentMode = .scaleAspectFit
 imageView.superview?.alignmentRectInsets.right. = CGRect(x: 0, y: 0, width: 0, height: 0)
 self.navigationItem.titleView = imageView
 */
    }
    @objc func presentMenu(){
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
    @objc func presentSearch(){
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
        override var preferredStatusBarStyle: UIStatusBarStyle {
                 return .lightContent
           }
}
