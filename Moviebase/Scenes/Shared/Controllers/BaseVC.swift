//
//  MainVC.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    var language: [Language?]?
    override func viewDidLoad() {
        super.viewDidLoad()
        //getAllLanguages()
        didLoded()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func didLoded() {
    }
    func getAllLanguages(){
        DataServices.getAllLanguages { (error,language)  in
            self.language  = language
        }
    }

}

