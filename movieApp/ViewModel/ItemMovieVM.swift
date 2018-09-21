//
//  itemMovieVM.swift
//  movieApp
//
//  Created by Devp.ios on 20/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import Foundation
import Lottie

class ItemMovieVM {
    
    let tagAddersViews :Int = 101
    // Genera animacion a la vista seleccionada
    func loadAnimImage(_ viewcenter: UIView,_ name: String, success:@escaping (LOTAnimationView) -> Void) {
        let animationView = LOTAnimationView(name: name)
        animationView.tag = tagAddersViews
        animationView.contentMode = .scaleAspectFill
        animationView.frame = CGRect(x: Int(viewcenter.frame.width/3), y: Int(viewcenter.frame.height/3), width: 100, height: 100)
        viewcenter.addSubview(animationView)
        animationView.loopAnimation = true
        success(animationView)
    }
    
    func clearAnimViews(cell: UIView){
        for view in cell.subviews {
            if(view.tag == tagAddersViews){
                view.removeFromSuperview()
            }
        }
    }
    
    // instancia imagen de pelicula a la vista seleccionada
    func finishLoadImage(_ animView: UIView,_ imageView: UIView ) {
        self.clearAnimViews(cell: animView)
    }
    
    // Metodo para carga de imagen de item Movie de las listas
    func getImage(_ cell: ItemListTableViewCell,_ movie: Movie,_ url: String){
        self.loadAnimImage(cell.viewAnim, Constants.MOVIE_LOADING, success: { (Anim) in
            Anim.play()
            cell.posterImg.image = nil
            self.getImageItemMovie(nameMovie: movie.title , pathImage: url, success: { (getImage) in
                DispatchQueue.main.async() {
                    if cell.tag == movie.id {
                        cell.posterImg.image = getImage
                        self.finishLoadImage(cell.viewAnim, cell.posterImg)
                    }else{
                        cell.posterImg.image = nil
                    }
                }
            }, failure: { (error) in
                print(error.localizedDescription)
            })
        })
    }
    
    // Llamado al servicio de descarga de imagen por Http
    func getImageItemMovie(nameMovie: String, pathImage: String, success:@escaping (UIImage) -> Void, failure:@escaping (Error) -> Void){
        Services.getImageUrl(nameResocurce: nameMovie, imageUrl: pathImage, success: { (resultImage) in
            success(resultImage)
        }) { (error) in
            failure(error)
        }
    }
    
}
