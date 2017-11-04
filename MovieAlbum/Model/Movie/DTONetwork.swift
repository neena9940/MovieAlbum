//
//  DTONetwork.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/24/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTONetwork {
    
    var id:         Int64?
    var name:       String?
    var country:    DTOCountry?
    
    init(jsonDictionary: [String : JSON]?) {
        //super.init()
        
        guard let dictionary = jsonDictionary else {
            return
        }
        
        mapping(jsonDictionary: dictionary)
    }
    
    func mapping(jsonDictionary : [String : JSON]) {
        
        id = jsonDictionary["id"]?.int64Value
        name = jsonDictionary["name"]?.stringValue
        //country
        
    }
}
