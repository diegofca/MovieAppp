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
    
    func loadAnimImage(_ viewcenter: UIView,_ name: String, success:@escaping (LOTAnimationView) -> Void) {
        let animationView = LOTAnimationView(name: name)
        animationView.contentMode = .scaleAspectFill
        animationView.frame = CGRect(x: Int(viewcenter.frame.width/3), y: Int(viewcenter.frame.height/3), width: 100, height: 100)
        viewcenter.addSubview(animationView)
        animationView.loopAnimation = true
        success(animationView)
    }
    
    func finishLoadImage(_ animView: UIView,_ imageView: UIView ) {
        animView.addSubview(imageView)
    }
    
    func getImage(_ cell: ItemListTableViewCell,_ movie: Movie,_ url: String){
        cell.posterImg.image = nil
        loadAnimImage(cell.viewAnim, "movie_loading", success: { (Anim) in
            Anim.play()
            self.getImageItemMovie(nameMovie: movie.title , pathImage: url, success: { (getImage) in
                DispatchQueue.main.async() {
                    if cell.tag == movie.id {
                        cell.posterImg.image = getImage
                        self.finishLoadImage(cell.viewAnim, cell.posterImg)
                    }
                }
                
            }, failure: { (error) in
                print(error.localizedDescription)
            })
        })
    }
    
    func getImageItemMovie(nameMovie: String, pathImage: String, success:@escaping (UIImage) -> Void, failure:@escaping (Error) -> Void){
        print(pathImage)
        Services.getImageUrl(nameResocurce: nameMovie, imageUrl: pathImage, success: { (resultImage) in
            success(resultImage)
        }) { (error) in
            failure(error)
        }
    }
    
}
