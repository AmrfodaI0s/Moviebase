//
//  GenreCell.swift
//  Moviebase
//
//  Created by Eslam on 5/12/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    @IBOutlet weak var genreType_label: UILabel!
    @IBOutlet weak var genreNameLabel: UILabel!
    @IBOutlet weak var genreCollection: UICollectionView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var state: Int?
    var popularMovies: [MoviesResult]? {
        didSet {
            genreCollection.reloadData()
    }}
    var nowPlayingMovies: [MoviesResult]? {
        didSet {
            genreCollection.reloadData()
    }}
    var upComingMovies: [MoviesResult]? {
        didSet {
            genreCollection.reloadData()
    }}
    var popularTVShows: [TVShowsResults]? {
        didSet {
            genreCollection.reloadData()
    }}
    var popularPeople: [PeopleResult]? {
        didSet {
            genreCollection.reloadData()
    }}
    var selectedCollection : (()->())?
    
    var selectedMovie: ((_ movieDetails: MoviesResult?) ->())?
    var selectedTVShow: ((_ tvShowbDetails: TVShowsResults?) ->())?
    var selectedActor: ((_ actorDetails: PeopleResult?) ->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        genreCollection.dataSource = self
        genreCollection.delegate = self
        genreCollection.register(UINib(nibName: "GenreImageCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.genreImageCell)
        genreCollection.register(UINib(nibName: "PopularPeopleCell", bundle: nil), forCellWithReuseIdentifier: K.Storyboard.popularPeopleCell)
    }
    @IBAction func showCollectionButtonPressed(_ sender: UIButton) {
        selectedCollection?()
    }
    
}
