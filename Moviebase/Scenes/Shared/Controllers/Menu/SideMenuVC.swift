//
//  SideMenuVC.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class SideMenuVC: BaseVC {

    override func didLoded() {
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//             return .lightContent
//       }
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        sideMenuViewController?.hideMenuViewController()
    }
    

}
