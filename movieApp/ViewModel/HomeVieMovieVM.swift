//
//  HomeVieMovieVM.swift
//  movieApp
//
//  Created by Devp.ios on 19/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import Foundation
import RealmSwift
import KVLoading

class HomeVieMovieVM {

    // Descarga de lista de generos
    func getListGenders( success:@escaping (Bool) -> Void, failure:@escaping (Error) -> Void) {
        KVLoading.show()
        Services.getGenders( success: { (resultGenders) in
            self.saveGenders(resultGenders)
            KVLoading.hide()
            success(true)
        }) { (error) in
            KVLoading.hide()
            failure(error)
        }
    }
    
    // Guarda los generos en base de datos local
    func saveGenders(_ genders: [Gender]){
        let realm = try! Realm()
        for nGender in genders {
            let oGender = GenderObject()
            oGender.id = String(nGender.id!)
            oGender.name = nGender.name!
            try! realm.write {
                realm.add(oGender, update: true)
            }
        }
    }
}
