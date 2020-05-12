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
    
    
    override func didLoded(){
        setNavBarItems()
        configureSliderCollection()
        //navigationController?.hidesBarsOnSwipe = true
    }
}
extension HomeVC {
    
    //MARK: - nav bar items
    func setNavBarItems(){
        //logo image
        let logo = UIImage(named: "micro.png")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        //imageView.superview?.alignmentRectInsets.right. = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.navigationItem.titleView = imageView
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
        
    }
    @objc func presentMenu(){
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
    @objc func presentSearch(){
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
    
}
