//
//  Service.swift
//  movieApp
//
//  Created by Devp.ios on 17/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

enum TypeMovie : String {
    case Popular   = "popular"
    case TopRating = "top_rated"
    case Upcoming = "upcoming"
}

class Services {
    static func getListMovies( typeList: TypeMovie , success:@escaping ([Movie]) -> Void, failure:@escaping (Error) -> Void ) {
        let url: String = "\(Constants.BASEURL)\(typeList.rawValue)\(Constants.API_KEY_V3)\(Constants.ES_LANGUAGE)"
        Alamofire.request(url).responseObject {(response: DataResponse<MovieList>) in
            if response.result.isSuccess {
                let nMovie = response.result.value!
                success(nMovie.movies)
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                print(response)
                failure(error)
            }
        }
    }
}
