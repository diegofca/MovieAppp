//
//  GenreMovie.swift
//  movieApp
//
//  Created by Devp.ios on 19/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Gender: Mappable {
    
    var id: Int!
    var name: String!
    var isGenders: Bool!
    
    init() {}
    
    required init (map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
    }
    func mapping(map: Map) {}
    
    static func getGender(_ id: Int)-> Gender {
        let realm = try! Realm()
        let oGender = realm.objects(GenderObject.self).filter("id = '\(id)'").first
        let nGender = Utils.mapGender(oGender!)
        return nGender
    }
}

//-------------------------------

// Clase para base de datos local REALM IO
class GenderObject: Object{
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// Clase para mapeo de list del objecto MOVIE
class GenreList : Mappable{
    var genres : [Gender]!
    required init?(map: Map) {}
    func mapping(map: Map) {
        genres <- map["genres"]
    }
}



