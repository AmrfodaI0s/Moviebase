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
    let transform = CGAffineTransform.identity

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
