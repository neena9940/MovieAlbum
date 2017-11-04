//
//  DTOMovieList.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/30/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTOMovieList {
    
    var data:[DTOMovie]?
    
     init() {
        //super.init()
        
        data = [DTOMovie]()
    }
    

    
    class func jsonToDTOMovieList(_ responseObject: [JSON]? /*Dictionary<String, JSON>*/) -> DTOMovieList? {
        var result =  DTOMovieList()
        
        if let resultArray = responseObject, resultArray.count > 0 {
            let movieList = DTOMovieList()
            
            for item in resultArray {
                let obj :DTOMovie = DTOMovie(jsonDictionary:item.dictionary)
                movieList.data?.append(obj)
            }
            
            result = movieList
        }
        
        return result
    }
    
    class func jsonToMovieList(_ responseValue: Any) -> AnyObject? {

        let swiftyJson = JSON(responseValue)

        if let responseObject = swiftyJson.array {
           // let result =  DTOServiceResult(json: responseObject)
            print(responseObject)
           // if (result!.status == ServiceResultStatus.Success) {
                let result = jsonToDTOMovieList(swiftyJson.array)
           // }

            return result!
        }
        return nil
    }
}
