//
//  MovieService.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/24/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol MovieServiceDelegate {
    func getMoviesList_Success(serviceResult: AnyObject)
    func getMoviesList_Fail(error: Error?)
}

class MovieService: BaseService {
    
    var delegate: MovieServiceDelegate? = nil
    //var manager: DSAPIManager?
    
    init(controller: AnyObject) {
        self.delegate = controller as? MovieServiceDelegate
        super.init()
    }
    func getMovies() {
        
        let urlString = "\(ApiConstants.ApiUrl)shows"
        
        let headers = Alamofire.SessionManager.defaultHTTPHeaders
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            debugPrint(response)
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value {
                    
                    if let result = DTOMovieList.jsonToMovieList(data) {
                        self.delegate?.getMoviesList_Success(serviceResult: result)
                    }
                }
                break
            case .failure(_):
                self.delegate?.getMoviesList_Fail(error: response.result.error)
                break
                
            }
            
        }
    }
}




