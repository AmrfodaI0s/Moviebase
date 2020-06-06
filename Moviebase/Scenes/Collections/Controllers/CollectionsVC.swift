//
//  CollectionsVC.swift
//  Moviebase
//
//  Created by Eslam on 5/20/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
import SwiftSpinner
class CollectionVC: BaseVC {
    var url = ""
    var selectedCollection: Movies? {
        didSet {
            results = selectedCollection?.results
            lastPage = selectedCollection?.totalPages ?? 0
            currentPage = 1
        }
    }
    var results : [Result]? = []
    var currentPage = 0
    var isLoading = false
    var lastPage = 0

    lazy var refresher: UIRefreshControl = { () -> UIRefreshControl in
        let ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(getMoreData), for: .valueChanged)
        return ref
    }()
    @IBOutlet weak var collectionView: UICollectionView!

    override func didLoded() {
        collectionView.addSubview(refresher)
        collectionView.register(UINib(nibName: "CollectionsCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.collectionsCell)
        self.shyNavBarManager.scrollView = collectionView

    }
    override func viewWillDisappear(_ animated: Bool) {

    }
    override func viewWillAppear(_ animated: Bool) {
    }
    @objc func getMoreData() {
        guard !isLoading else { return }
        guard currentPage < lastPage else { return }
        SwiftSpinner.show("")
        isLoading = true
        print(url)
        MovieServices.getMoreMovies(url: url, currentPage+1) { (error, collection: Movies?) in
                for data in collection!.results {
                        self.results?.append(data)
            }
           
            //self.results?.append(contentsOf: movies)
            self.isLoading = false
            SwiftSpinner.hide()
            self.collectionView.reloadData()
            self.currentPage += 1
            self.lastPage = self.selectedCollection?.totalPages ?? 0
        }
    }
}
