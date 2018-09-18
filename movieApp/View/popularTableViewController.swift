//
//  popularTableViewController.swift
//  movieApp
//
//  Created by Devp.ios on 18/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import UIKit
import Material

class popularTableViewController:  UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableMoviesPopular : UITableView!
    var indexMovieCurrent: Int = 0
    var popularMovies: [Movie] = []
    var viewModelController : ListMovieVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelController = ListMovieVM()  // Crea instancia de viewmodel de la vista
        viewModelController.getListMovies( .Popular ,success: { (moviesResult) in
            self.popularMovies = moviesResult
            self.tableMoviesPopular.reloadData()
        }, failure: { (error) in
            // send error
        })
    }

    //MARK: Pragma TableView   - - - - - - - - --
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellMovieView", for: indexPath) as! ItemListTableViewCell
        
        cell.nameMovieTxt?.text = popularMovies[indexPath.row].title
        cell.genderMovieTxt?.text = String( popularMovies[indexPath.row].genre_ids[0] )
        cell.detailBtn.tag = indexPath.row
        cell.detailBtn.addTarget(self, action: #selector(sendMovie), for: .touchUpInside)
        
        return cell
    }
    
    @objc func sendMovie(_ sender: UIButton) {
        indexMovieCurrent = sender.tag
        performSegue(withIdentifier: "detailSegueView", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegueView"{
            if let detailView = segue.destination as? DetailMovieViewController {
                detailView.movie = popularMovies[indexMovieCurrent]
            }
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

}
