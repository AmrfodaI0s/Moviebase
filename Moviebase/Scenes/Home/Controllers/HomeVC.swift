//
//  HomeVC.swift
//  Moviebase
//
//  Created by Eslam on 5/11/20.
//  Copyright © 2020 Eslam. All rights reserved.
//
import AMScrollingNavbar
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
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.scrollingNavbarDelegate = self
        }
        setNavBarItems()
        configureSliderCollection()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(SuperCollection, delay: 10)
        }
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        if let navigationController = navigationController as? ScrollingNavigationController {
//            navigationController.stopFollowingScrollView()
//        }
//    }
}
//MARK: - NavBar Settings
extension HomeVC {
    func addImageToNavBar() {
        
        guard let navBar = self.navigationController?.navigationBar
           else { return }
        navBar.layer.opacity = 0
        navBar.setGradientBackground(colors: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7013324058), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7013324058), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5453499572), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.449620077), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25) ,#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15) ,#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05369755988)], startPoint: .custom(point: CGPoint(x: 0.0, y: 0.2)), endPoint: .custom(point: CGPoint(x: 0, y: 0.9)))
        navBar.shadowImage = UIImage()
        navBar.addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -16),
            profileImage.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 0),
            profileImage.widthAnchor.constraint(equalToConstant: 48),
            profileImage.heightAnchor.constraint(equalToConstant: 48)
        ])
       
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        if let navigationController = navigationController as? ScrollingNavigationController {
//          navigationController.showNavbar(animated: true)
//        }
//    }
        
    //MARK: - nav bar items
    func setNavBarItems(){
        addImageToNavBar()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
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
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
//MARK: - Scrolling Delegate Methods
extension HomeVC: ScrollingNavigationControllerDelegate {
 
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.showNavbar(animated: true, scrollToTop: true)
        }
        return true
    }
    //MARK: - Did Scroll UP || Down
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let navigationController = navigationController as? ScrollingNavigationController else { return }
        if self.lastContentOffset > scrollView.contentOffset.y {
            navigationController.showNavbar(animated: true, duration: 0, scrollToTop: false, completion: nil)
            navigationController.showNavbar()
                    print("scrolling to top")
        } else if self.lastContentOffset < scrollView.contentOffset.y {
                          print("scrolling to Bottom")
                   navigationController.hideNavbar(animated: true, duration: 0.3)
               }
    }

}
//MARK: - Movie Services
extension HomeVC {

}
/*
 logo image
 let logo = UIImage(named: "micro.png")
 let imageView = UIImageView(image:logo)
 imageView.contentMode = .scaleAspectFit
 imageView.superview?.alignmentRectInsets.right. = CGRect(x: 0, y: 0, width: 0, height: 0)
 self.navigationItem.titleView = imageView
 */ /*
 let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
 let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
 let blurEffectView = UIVisualEffectView(effect: blurEffect)
 blurEffectView.frame = navBar.bounds
 blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
 navBar.addSubview(blurEffectView)
 navBar.setBackgroundImage(UIImage(), for: .default)
 */
class UINavigationBarGradientView: UIView {

    enum Point {
        case topRight, topLeft
        case bottomRight, bottomLeft
        case custom(point: CGPoint)

        var point: CGPoint {
            switch self {
                case .topRight: return CGPoint(x: 1, y: 0)
                case .topLeft: return CGPoint(x: 0, y: 0)
                case .bottomRight: return CGPoint(x: 1, y: 1)
                case .bottomLeft: return CGPoint(x: 0, y: 1)
                case .custom(let point): return point
            }
        }
    }

    private weak var gradientLayer: CAGradientLayer!

    convenience init(colors: [UIColor], startPoint: Point = .topLeft,
                     endPoint: Point = .bottomLeft, locations: [NSNumber] = [0, 1]) {
        self.init(frame: .zero)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        layer.addSublayer(gradientLayer)
        self.gradientLayer = gradientLayer
        set(colors: colors, startPoint: startPoint, endPoint: endPoint, locations: locations)
        backgroundColor = .clear
    }

    func set(colors: [UIColor], startPoint: Point = .topLeft,
             endPoint: Point = .bottomLeft, locations: [NSNumber] = [0, 1]) {
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint.point
        gradientLayer.endPoint = endPoint.point
        gradientLayer.locations = locations
    }

    func setupConstraints() {
        guard let parentView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
        parentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        parentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard let gradientLayer = gradientLayer else { return }
        gradientLayer.frame = frame
        superview?.addSubview(self)
    }
}

extension UINavigationBar {
    func setGradientBackground(colors: [UIColor],
                               startPoint: UINavigationBarGradientView.Point = .topLeft,
                               endPoint: UINavigationBarGradientView.Point = .bottomLeft,
                               locations: [NSNumber] = [0, 0.1, 0.9, 1]) {
        guard let backgroundView = value(forKey: "backgroundView") as? UIView else { return }
        guard let gradientView = backgroundView.subviews.first(where: { $0 is UINavigationBarGradientView }) as? UINavigationBarGradientView else {
            let gradientView = UINavigationBarGradientView(colors: colors, startPoint: startPoint,
                                                           endPoint: endPoint, locations: locations)
            backgroundView.addSubview(gradientView)
            
            gradientView.setupConstraints()
            return
        }
        gradientView.set(colors: colors, startPoint: startPoint, endPoint: endPoint, locations: locations)
    }
}
