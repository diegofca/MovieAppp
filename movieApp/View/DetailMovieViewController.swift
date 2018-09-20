//
//  DetailMovieViewController.swift
//  movieApp
//
//  Created by Devp.ios on 18/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class DetailMovieViewController: UIViewController {

    @IBOutlet var containerViewVideo: UIView!
    @IBOutlet var containerLabelsVideo: UIView!
    
    @IBOutlet var videoView: UIView!
    @IBOutlet var titleMovie: UILabel!
    @IBOutlet var overviewMovie: UILabel!
    @IBOutlet var voteCountMovie: UILabel!
    @IBOutlet var vote_average: UILabel!
    @IBOutlet var popularity: UILabel!
    @IBOutlet var release_date: UILabel!
    
    var movie: Movie!
    var detailViewModel: DetailMovieVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModal()
        setUpView()
    }
    
    func setUpViewModal(){
        detailViewModel = DetailMovieVM()
    }
    
    func setUpView(){
        containerViewVideo.viewShadow()
        containerLabelsVideo.viewShadow()
        detailViewModel.setTrailer(url: movie.path_trailer, view: videoView) { (videoController) in
            self.present(videoController, animated: true) {
                videoController.player!.play()
            }
        }
        
        titleMovie.text     = movie.title
        overviewMovie.text  = movie.overview
        voteCountMovie.text = "\(NSLocalizedString("detailViewModelController.voteCountMovie", comment: "")) \(movie.vote_count!)"
        vote_average.text   = String(movie.vote_average)
        popularity.text     = String(movie.popularity)
        release_date.text   = movie.release_date
        
    }
    
    @IBAction func backToList(_ sender: Any) {
        print("fuck")
        backNavigation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backNavigation(){
        self.dismiss(animated: true, completion: nil)
    }
}
