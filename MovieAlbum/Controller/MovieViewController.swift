//
//  MovieViewController.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/25/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import UIKit

class MovieViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MovieServiceDelegate {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    var dataArray: DTOMovieList? //[DTOMovie]?
    var moviesService: MovieService?

    var currentMovieViewController: MovieDetailsViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
        //self.title = "GOMOVIES"
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func setContent() {
        moviesService = MovieService(controller: self)
        //moviesService?.delegate = self
        
        moviesService?.getMovies()
    }
    
    //MARK: MovieService Delegate
    
    func getMoviesList_Success(serviceResult: AnyObject) {
        if let movieList = serviceResult as? DTOMovieList {
            dataArray = movieList
            movieCollectionView.reloadData()
            //return
        }
    }
    
    func getMoviesList_Fail(error: Error?) {
        print("Error while getting Data...")
    }
    
    //MARK: Collection View Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = dataArray?.data, data.count > 0 {
        return (data.count)
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let movie = dataArray?.data?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
      let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setContentWith(movie: movie)
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let c = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            currentMovieViewController = c
            currentMovieViewController?.currentMovie = dataArray?.data![indexPath.row]
            self.navigationController?.pushViewController(c, animated: true)
        }
    }
    
   
    
    
}
