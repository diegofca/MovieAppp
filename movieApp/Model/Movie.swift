//
//  Movie.swift
//  movieApp
//
//  Created by Devp.ios on 17/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    
    var id: Int!
    var title: String!
    var poster_path: String!
    var genre_ids: [Int]!
    var overview: String!
    var vote_count: Int!
    var vote_average: Float!
    var popularity: Float!
    var release_date: String!
    var path_trailer: String = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4" // Deje el link quemado porque la lista que descargo no tiene ningun campo que retonro un link para video
    
    init(){ }
    
    required init (map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.poster_path <- map["poster_path"]
        self.genre_ids <- map["genre_ids"]
        self.overview <- map["overview"]
        self.vote_count <- map["vote_count"]
        self.vote_average <- map["vote_average"]
        self.popularity <- map["popularity"]
        self.release_date <- map["release_date"]
    }
    
    func mapping(map: Map) {}
    
}

class MovieList : Mappable{
    var movies : [Movie]!
    required init?(map: Map) {}
    func mapping(map: Map) {
        movies <- map["results"]
    }
}
