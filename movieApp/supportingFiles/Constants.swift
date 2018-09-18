//
//  Constants.swift
//  movieApp
//
//  Created by Devp.ios on 17/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import UIKit
import Material

extension UIView{
    
    /**
     Funcion utilizada para aplicar view shadow a view
     */
    func viewShadow(){
        let COLOR_DARKGRAY:UIColor = UIColor.darkGray
        self.layer.cornerRadius = 8.0
        self.layer.shadowColor = COLOR_DARKGRAY.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    /**
     Funcion utilizada para agregar imagen de background a uiViewController
     */
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

class Constants {
    static let API_KEY_V3 = "?api_key=b0e3cab3aba2ea9d7d5271d0f6e03d53"
    static let ES_LANGUAGE = "&language=es-ES"
    static let BASEURL = "https://api.themoviedb.org/3/movie/"
}



