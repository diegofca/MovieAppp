//
//  ListMovieVM.swift
//  movieApp
//
//  Created by Devp.ios on 18/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//
import UIKit

class ListMovieVM {
    
    func getListMovies(_ typeList: TypeMovie, success:@escaping ([Movie]) -> Void, failure:@escaping (Error) -> Void) {
        Services.getListMovies(typeList: typeList, success: { (resultMovies) in
            success(resultMovies)
        }) { (error) in
            failure(error)
        }
    }
        
}
