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

extension UIView{
    
    // Funcion utilizada para aplicar view shadow a view
    func viewShadow(){
        let COLOR_DARKGRAY:UIColor = UIColor.darkGray
        self.layer.cornerRadius = 8.0
        self.layer.shadowColor = COLOR_DARKGRAY.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    
    //Funcion utilizada para agregar imagen de background a uiViewController
    func assignbackground(name:String){
        let background = UIImage(named: name)
        var imageView : UIImageView!
        imageView = UIImageView(frame: self.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = self.center
        self.addSubview(imageView)
        self.sendSubview(toBack: imageView)
    }
    
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}

class Utils {
    
    // Mapeo de Objecto 'Movie' a 'MovieObject'
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
    
    // Mapeo de Objecto 'MovieObject' a 'Movie'
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
    
    // Mapeo de Objecto 'GenderObject' a 'Gender'
    static func mapGender(_ oGender: GenderObject) -> Gender{
        let nGender  = Gender()
        nGender.id   = Int(oGender.id)
        nGender.name = oGender.name
        return nGender
    }
    
    // Creacion de Searchbar
    static func creatingSearhBarToTable() -> UISearchController{
        let searchController : UISearchController!
        let image = Constants.RED_WINE_COLOR.image(CGSize(width: 128, height: 128))
        searchController = UISearchController(searchResultsController: nil)
        searchController?.obscuresBackgroundDuringPresentation = false
        return searchController
    }
    
    // Creacion de Searchbar
    static func setSearhBarToTable(_ searchBar : UISearchBar){
        let image = Constants.RED_WINE_COLOR.image(CGSize(width: 128, height: 128))
        searchBar.placeholder = "Nombre película"
        searchBar.setBackgroundImage(image ,for: UIBarPosition.top, barMetrics: UIBarMetrics.default)
    }
    
    // Creacion de Alert
    static func showPopUp(_ title:String,_ msg:String,_ view: UIViewController){
        KVLoading.hide()
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        view.present(alertController, animated: true, completion: nil)
    }
    
}
