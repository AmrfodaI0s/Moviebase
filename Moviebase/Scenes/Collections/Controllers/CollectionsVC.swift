
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
    var selectedMoviesCollection: Movies? {
        didSet {
            moviesResults = selectedMoviesCollection?.results
            lastPage = selectedMoviesCollection?.totalPages ?? 0
            currentPage = 1
        }
    }
    var selectedTVShowsCollection: TVShows? {
        didSet {
            tvShowaResults = selectedTVShowsCollection?.results
            lastPage = selectedTVShowsCollection?.totalPages ?? 0
            currentPage = 1
        }
    }
    var selectedPeopleCollection: PopularPeople? {
           didSet {
               popularPeopleResults = selectedPeopleCollection?.results
               lastPage = selectedPeopleCollection?.totalPages ?? 0
               currentPage = 1
           }
       }
    var flag = 0
    var moviesResults : [MoviesResult]? = []
    var tvShowaResults : [TVShowsResults]? = []
    var popularPeopleResults : [PeopleResult]? = []
    var currentPage = 0
    var isLoading = false
    var lastPage = 0
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            //collectionView.addSubview(refresher)
            collectionView.register(UINib(nibName: "CollectionsCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.collectionsCell)
        }
    }
    override func didLoded() {
        self.shyNavBarManager.scrollView = collectionView
    }
    //MARK: - Paginate to get more requested data
     func getMore() {
        guard !isLoading else { return }
        guard currentPage < lastPage else { return }
        SwiftSpinner.show("")
        isLoading = true
        if flag == 4 {
            DataServices.GET(url: url, currentPage+1) { (error, collection: TVShows?) in
                for data in collection!.results {
                    self.tvShowaResults?.append(data)
                }
                self.lastPage = self.selectedTVShowsCollection?.totalPages ?? 0
                self.didLoaded(with: self.selectedTVShowsCollection?.totalPages ?? 0)
            }
        } else if flag == 5 {
            DataServices.GET(url: url, currentPage+1) { (error, collection: PopularPeople?) in
                for data in collection!.results {
                    self.popularPeopleResults?.append(data)
                }
                self.didLoaded(with: self.selectedPeopleCollection?.totalPages ?? 0)
            }
        }   else {
            DataServices.GET(url: url, currentPage+1) { (error, collection: Movies?) in
                for data in collection!.results {
                    self.moviesResults?.append(data)
                }
                self.didLoaded(with: self.selectedMoviesCollection?.totalPages ?? 0)
            }
        }
    }
    func didLoaded(with lastPage: Int) {
        self.isLoading = false
        SwiftSpinner.hide()
        self.collectionView.reloadData()
        self.currentPage += 1
        self.lastPage = lastPage
    }

}
