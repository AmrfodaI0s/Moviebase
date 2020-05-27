//
//  CollectionsVC.swift
//  Moviebase
//
//  Created by Eslam on 5/20/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
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
    var lastPage = 0
    var currentPage = 0
    var isLoading = false

    lazy var refresher: UIRefreshControl = { () -> UIRefreshControl in
        let ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(getMoreData), for: .valueChanged)
        return ref
    }()
    @IBOutlet weak var collectionView: UICollectionView!

    override func didLoded() {
        collectionView.addSubview(refresher)
        collectionView.register(UINib(nibName: "CollectionsCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.collectionsCell)
        self.navigationController?.navigationBar.tintColor = .yellow
        self.shyNavBarManager.scrollView = collectionView

    }
    override func viewWillDisappear(_ animated: Bool) {

    }
    override func viewWillAppear(_ animated: Bool) {
    }
    @objc func getMoreData() {
        guard !isLoading else { return }
        guard currentPage < lastPage else { return }
        isLoading = true
        MovieServices.getMoreMovies(url: url, currentPage+1) { (error, collection, lastPage) in
                for data in collection!.results {
                self.results?.append(data)
            }
            self.isLoading = false
            self.collectionView.reloadData()
            self.currentPage += 1
            self.lastPage = lastPage
        }
    }
}
