//
//  DTOExternal.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/24/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTOExternal {
    
    var tvrage:     Int64?
    var thetvdb:    Int64?
    var imdb:       String?
    
    init(jsonDictionary: [String : JSON]?) {
       // super.init()
        
        guard let dictionary = jsonDictionary else {
            return
        }
        
        mapping(jsonDictionary: dictionary)
    }
    
    func mapping(jsonDictionary : [String : JSON]) {
        
        tvrage = jsonDictionary["tvrage"]?.int64Value
        thetvdb = jsonDictionary["thetvdb"]?.int64Value
        imdb = jsonDictionary["imdb"]?.stringValue
    }
}
