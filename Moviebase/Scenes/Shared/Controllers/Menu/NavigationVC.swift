//
//  NavigationVC.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//
import UIKit
import AKSideMenu
class RootViewController: AKSideMenu, AKSideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuViewController?.delegate = self
    }
    override func awakeFromNib() {
        self.contentViewController = self.storyboard!.instantiateViewController(withIdentifier: K.Storyboard.homeVC)
        self.leftMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: K.Storyboard.sideMenuVC)
    }
    open func sideMenu(_ sideMenu: AKSideMenu, shouldRecognizeGesture recognizer: UIGestureRecognizer, simultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // return true to allow both gesture recognizers to recognize simultaneously. Returns false by default
        return false
    }

    open func sideMenu(_ sideMenu: AKSideMenu, gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // return true or false based on your failure requirements. Returns false by default
        return false
    }

    open func sideMenu(_ sideMenu: AKSideMenu, gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // return true or false based on your failure requirements. Returns false by default
        return false
    }

    open func sideMenu(_ sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
        print("willShowMenuViewController")
    }

    open func sideMenu(_ sideMenu: AKSideMenu, didShowMenuViewController menuViewController: UIViewController) {
        print("didShowMenuViewController")
    }

    open func sideMenu(_ sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        print("willHideMenuViewController")
    }

    open func sideMenu(_ sideMenu: AKSideMenu, didHideMenuViewController menuViewController: UIViewController) {
        print("didHideMenuViewController")
    }
    
    


}
