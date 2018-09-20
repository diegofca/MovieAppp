//
//  HomeViewController.swift
//  movieApp
//
//  Created by Devp.ios on 19/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import UIKit
import RealmSwift
import KVLoading

class HomeViewController: UIViewController {

    var viewModel : HomeVieMovieVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setViewModel()
        // LLamado a descarga de generos
        viewModel.getListGenders( success: { (isSuccess) in
            self.nextTabsView()
        }, failure: { (error) in
            Utils.showPopUp("Error","Imposible descargar datos", self)
        })
    }
    
    func nextTabsView(){
        performSegue(withIdentifier: "tabsMovieSegueView", sender: nil)
    }
    
    func setViewModel(){
        viewModel = HomeVieMovieVM()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tabsMovieSegueView"{
            if segue.destination is tabstMoviesView {
            }
        }
    }
    

}
