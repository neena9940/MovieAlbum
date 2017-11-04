//
//  DTOCountry.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/24/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTOCountry {
    
    var name:       String?
    var code:       String?
    var timezone:   String?
    
    init(jsonDictionary: [String : JSON]?) {
        //super.init()
        
        guard let dictionary = jsonDictionary else {
            return
        }
        
        mapping(jsonDictionary: dictionary)
    }
    
    func mapping(jsonDictionary : [String : JSON]) {
        
        name = jsonDictionary["name"]?.stringValue
        code = jsonDictionary["code"]?.stringValue
        timezone = jsonDictionary["timezone"]?.stringValue
    }
}
