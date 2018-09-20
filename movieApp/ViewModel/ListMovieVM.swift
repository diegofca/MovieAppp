//
//  ListMovieVM.swift
//  movieApp
//
//  Created by Devp.ios on 18/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//
import UIKit
import RealmSwift
import KVLoading

class ListMovieVM {
    
    var listMovies = [Movie]()
    var filteredMovies = [Movie]()
    var activeSearch = false
    
    // Descarga de lista de peliculas filtrando el tipo
    func getListMovies(_ typeList: TypeMovie, success:@escaping ([Movie]) -> Void, failure:@escaping (Error) -> Void) {
        KVLoading.show()
        Services.getListMovies(typeList: typeList, success: { (resultMovies) in
            self.listMovies = resultMovies
            self.saveMovies(resultMovies)
            KVLoading.hide()
            success(resultMovies)
        }) { (error) in
            failure(error)
        }
    }
    
    // Busca la pelicula seleccionada en cualuqier lista por "id" en posicion de la lista
    func getCurrentMovieDetail(_ idx: Int) -> Movie{
        var currentMovie: Movie!
        if(!activeSearch){
            currentMovie = listMovies[idx]
        }else{
            currentMovie = filteredMovies[idx]
        }
        return currentMovie
    }
    
    // Busca la pelicula seleccionada en cualuqier lista por "id" en base de datos local
    func getCurrentMovieDetailById(_ id: Int) -> Movie{
        let realm = try! Realm()
        let oMovie = realm.objects(MovieObject.self).filter("id = '\(id)'").first!
        let currentMovie = Utils.mapMovie(oMovie)
        return currentMovie
    }
    
    // Guarda todas las peliculas que se han descargado
    func saveMovies(_ list: [Movie]){
        let realm = try! Realm()
        for nMovie in list {
            let oMovie = Utils.mapMovieObject(nMovie)
            try! realm.write {
                realm.add(oMovie, update: true)
            }
        }
    }
    
    // Gurada peliculas popular en base de datos local
    func savePopularMovieList(_ list: [Movie]) {
        let realm = try! Realm()
        for nMovie in list {
            let pMovie = PopularMovies()
            pMovie.id = String(nMovie.id)
            try! realm.write {
                realm.add(pMovie)
            }
        }
    }
    
    // Guarda peliculas top rating en base de datos local
    func saveTopRatingMovieList(_ list: [Movie]) {
        let realm = try! Realm()
        for nMovie in list {
            let pMovie = TopRatingMovies()
            pMovie.id = String(nMovie.id)
            try! realm.write {
                realm.add(pMovie)
            }
        }
    }
    
    // Guarda peliculas top rating en base de datos local
    func saveUpComingMovieList(_ list: [Movie]) {
        let realm = try! Realm()
        for nMovie in list {
            let pMovie = UpComingMovies()
            pMovie.id = String(nMovie.id)
            try! realm.write {
                realm.add(pMovie)
            }
        }
    }
    
}
