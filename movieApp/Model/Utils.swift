//
//  Utils.swift
//  movieApp
//
//  Created by Devp.ios on 19/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import Foundation
import UIKit
import KVLoading

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}

class Utils {
    
   static func mapMovieObject(_ movie: Movie) -> MovieObject{
        let oMovie          = MovieObject()
        oMovie.id           = String(movie.id)
        oMovie.uId          = movie.id
        oMovie.title        = movie.title
        oMovie.overview     = movie.overview
        oMovie.vote_average = String(movie.vote_average)
        oMovie.vote_count   = String(movie.vote_count)
        oMovie.path_trailer = movie.path_trailer
        oMovie.poster_path  = movie.poster_path
        oMovie.popularity   = String(movie.popularity)
        return oMovie
    }
    
   static func mapMovie(_ oMovie: MovieObject) -> Movie{
        let nMovie          = Movie()
        nMovie.id           = Int(oMovie.id)
        nMovie.title        = oMovie.title
        nMovie.overview     = oMovie.overview
        nMovie.vote_average = Float(oMovie.vote_average)
        nMovie.vote_count   = Int(oMovie.vote_count)
        nMovie.path_trailer = oMovie.path_trailer!
        nMovie.poster_path  = oMovie.poster_path
        nMovie.popularity   = Float(oMovie.popularity)
        return nMovie
    }
    
    static func mapGender(_ oGender: GenderObject) -> Gender{
        let nGender  = Gender()
        nGender.id   = Int(oGender.id)
        nGender.name = oGender.name
        return nGender
    }
    
    static func creatingSearhBarToTable() -> UISearchController{
        let searchController : UISearchController!
        let image = Constants.RED_WINE_COLOR.image(CGSize(width: 128, height: 128))
        searchController = UISearchController(searchResultsController: nil)
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = "Nombre pelicula"
        searchController?.searchBar.setBackgroundImage(image ,for: UIBarPosition.top, barMetrics: UIBarMetrics.default)
        return searchController
    }
    
    static func showPopUp(_ title:String,_ msg:String,_ view: UIViewController){
        KVLoading.hide()
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        view.present(alertController, animated: true, completion: nil)
    }
    
}
