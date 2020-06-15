//
//  Helper.swift
//  Moviebase
//
//  Created by Eslam on 5/15/20.
//  Copyright © 2020 Eslam. All rights reserved.
//
import UIKit
import Kingfisher
import SwiftSpinner

class Helper {

    //MARK: -  set Status bar Color
    static func setStatusBarColor(view : UIView , withColor:UIColor) {
        let tag = 12321
        if let _ = view.viewWithTag(tag){
        } else {
            let overView = UIView()
            //overView.frame = UIApplication.shared.statusBarFrame
            overView.backgroundColor = withColor
            overView.tag = tag
            view.addSubview(overView)
        }
    }
    
    class func Spinner(hidden: Bool,_ msg: String?) {
        if hidden {
            DispatchQueue.main.async {
                SwiftSpinner.hide()
            }
        } else {
            DispatchQueue.main.async {
                SwiftSpinner.show(msg ?? "")
            }
        }
    }
    
    //MARK: -  save Device FrameHeight to UserDefault
    class func saveUserDefaults(height : CGFloat) {
        let userDefault = UserDefaults.standard
        userDefault.set(height, forKey: "frameHeight")
        userDefault.synchronize()
    }
    
    //MARK: -  Set Image by url - KF
    class func displayImage(imageView: UIImageView?, url: String?) {
        let Url =  URLs.ImageRequestURL_w1280 + (url ?? "")
        imageView?.kf.indicatorType = .activity
        imageView?.kf.setImage(with: URL(string : Url), placeholder: UIImage(named: "image-placeholder"), options: [.transition(.flipFromRight(0.3))])
    }

} // end of Helper class
