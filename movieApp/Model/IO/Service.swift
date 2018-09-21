//
//  Service.swift
//  movieApp
//
//  Created by Devp.ios on 17/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import ObjectMapper
import AlamofireObjectMapper

enum TypeMovie : String {
    case Popular   = "popular"
    case TopRating = "top_rated"
    case Upcoming  = "upcoming"
}

class Services {
    
    // Servicio para tomar lista de peliculas con un tipo seleccionado
    static func getListMovies( typeList: TypeMovie , success:@escaping ([Movie]) -> Void, failure:@escaping (Error) -> Void ) {
        let url: String = "\(Constants.BASEURL)\(Constants.GET_MOVIE_LIST)\(typeList.rawValue)\(Constants.API_KEY_V3)\(Constants.ES_LANGUAGE)"
        Alamofire.request(url).responseObject {(response: DataResponse<MovieList>) in
            if response.result.isSuccess {
                let nMovie = response.result.value!
                success(nMovie.movies)
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
    // Servicio de descarga de generos de películas
    static func getGenders( success:@escaping ([Gender]) -> Void, failure:@escaping (Error) -> Void ){
        let url: String = "\(Constants.BASEURL)\(Constants.GET_GENDER_LIST)\(Constants.API_KEY_V3)\(Constants.ES_LANGUAGE)"
        Alamofire.request(url).responseObject {(response: DataResponse<GenreList>) in
            if response.result.isSuccess {
                let nGender = response.result.value!
                success(nGender.genres)
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
    // Servicio de descarga de imagenes
    static func getImageUrl(nameResocurce: String, imageUrl: String, success:@escaping (UIImage) -> Void, failure:@escaping (Error) -> Void ) {
        
        Alamofire.request (imageUrl, method: .get,
                           parameters:  nil,
                           encoding:  URLEncoding.default,
                           headers: nil ).responseImage { response in
            if response.result.isSuccess {
                if let imageResult = response.result.value {
                    let image = imageResult
                    success(image)
                }
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
    
    
    
}
