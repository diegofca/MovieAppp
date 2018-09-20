//
//  DetailMovieVM.swift
//  movieApp
//
//  Created by Devp.ios on 18/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class DetailMovieVM {

    var movie: Movie!

    func setTrailer(url: String, view : UIView, success:@escaping (AVPlayerViewController) -> Void) {
        let player = AVPlayer(url: URL(string: url )!)
        let avpController = AVPlayerViewController()
        avpController.player = player
        avpController.view.frame.size.height = view.frame.size.height
        avpController.view.frame.size.width = view.frame.size.width
        view.addSubview(avpController.view)
        success(avpController)
    }
    
    func getPoster(_ url: String ){
        
    }
    
}
