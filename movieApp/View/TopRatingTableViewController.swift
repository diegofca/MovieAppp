//
//  TopRatingTableViewController.swift
//  movieApp
//
//  Created by Devp.ios on 19/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import UIKit
import Material

class TopRatingTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet var tableTopRatingPopular : UITableView!
    
    var idMovieCurrent: Int = 0
    var viewModel : ListMovieVM!
    var searchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListMovieVM()  // Crea instancia de viewmodel de la vista
        viewModel.getListMovies( .TopRating ,success: { (resultMovies) in
            self.tableTopRatingPopular.reloadData()
            self.viewModel.saveTopRatingMovieList(resultMovies)
            self.setTableView()
        }, failure: { (error) in
            Utils.showPopUp("Error","Imposible descargar datos", self)
        })
    }
    
    func setTableView(){
        searchController = Utils.creatingSearhBarToTable()
        searchController?.searchBar.delegate = self
        self.tableTopRatingPopular.tintColor = UIColor.orange
        self.tableTopRatingPopular.tableHeaderView = searchController?.searchBar
        self.tableTopRatingPopular.reloadData()
    }
    
    //Delegado del searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            self.viewModel.filteredMovies = self.viewModel.listMovies.filter{ $0.title.lowercased().contains(searchText.lowercased()) }
            self.viewModel.activeSearch = true
        } else {
            self.viewModel.filteredMovies.removeAll(keepingCapacity: true)
            self.viewModel.activeSearch = false
        }
        self.tableTopRatingPopular.reloadData()
    }
    
    //Delegado del boton cancel del Searchbar
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.filteredMovies.removeAll(keepingCapacity: true)
        self.viewModel.activeSearch = false
        self.tableTopRatingPopular.reloadData()
    }
    
    //MARK: Pragma TableView   - - - - - - - - --
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return !self.viewModel.activeSearch ? self.viewModel.listMovies.count : self.viewModel.filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellMovieView", for: indexPath) as! ItemListTableViewCell
        
        var movie = Movie()
        if !self.viewModel.activeSearch {
            movie = self.viewModel.listMovies[indexPath.row]
        }else{
            movie = self.viewModel.filteredMovies[indexPath.row]
        }
        
        let genderId = movie.genre_ids[0]
        let gender = Gender.getGender(genderId)
        let posterPath = movie.poster_path
        cell.tag = movie.id!
        cell.nameMovieTxt?.text = movie.title
        cell.genderMovieTxt?.text = gender.name
        cell.detailBtn.tag = movie.id!
        cell.detailBtn.addTarget(self, action: #selector(sendMovie), for: .touchUpInside)
        cell.viewModelitem.getImage( cell, movie, "\(Constants.IMG_BASEURL)\(posterPath!)")
        return cell
    }
    
    //Seleccion de objecto "Movie" para configurcion de envio a vista detalle
    @objc func sendMovie(_ sender: UIButton) {
        idMovieCurrent = sender.tag
        performSegue(withIdentifier: "detailSegueView", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegueView"{
            if let detailView = segue.destination as? DetailMovieViewController {
                detailView.movie = self.viewModel.getCurrentMovieDetailById( idMovieCurrent )
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
