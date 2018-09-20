//
//  TopRatingMovies.swift
//  movieApp
//
//  Created by Devp.ios on 19/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//


import Foundation
import RealmSwift

class TopRatingMovies : Object {
    @objc dynamic var id: String!
    
    static func getMovie(_ id: Int)-> Movie {
        let realm = try! Realm()
        let oMovie = realm.objects(MovieObject.self).filter("id = '\(id)'").first!
        let nMovie = Utils.mapMovie(oMovie)
        return nMovie
    }
}
