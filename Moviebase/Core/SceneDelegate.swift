//
//  SceneDelegate.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
import AKSideMenu
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        //let navigationController: UINavigationController = UINavigationController.init(rootViewController: RootViewController.init(contentViewController: HomeVC(), leftMenuViewController: SideMenuVC(), rightMenuViewController: nil))
        //let leftMenuViewController: LeftMenuViewController = LeftMenuViewController.init()
        //let rightMenuViewController: RightMenuViewController = RightMenuViewController.init()

        // Create side menu controller
        //let sideMenuViewController: AKSideMenu = AKSideMenu(contentViewController: navigationController, leftMenuViewController: SideMenuVC(), rightMenuViewController: nil)

        // Make it a root controller
        //window!.rootViewController = sideMenuViewController

        //window!.backgroundColor = UIColor.white
        //window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
//        let navigationController: UINavigationController = UINavigationController.init(rootViewController: RootViewController.init(contentViewController: HomeVC(), leftMenuViewController: SideMenuVC(), rightMenuViewController: nil))
//        //let leftMenuViewController: LeftMenuViewController = LeftMenuViewController.init()
//        //let rightMenuViewController: RightMenuViewController = RightMenuViewController.init()
//
//        // Create side menu controller
//        let sideMenuViewController: AKSideMenu = AKSideMenu(contentViewController: navigationController, leftMenuViewController: SideMenuVC(), rightMenuViewController: nil)
//
//        // Make it a root controller
//        window!.rootViewController = sideMenuViewController
//
//        window!.backgroundColor = UIColor.white
//        window?.makeKeyAndVisible()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

