//
//  DTOImage.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/24/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTOImage {
    
    var medium:     String?
    var original:   String?
    
    init(jsonDictionary: [String : JSON]?) {
       // super.init()
        
        guard let dictionary = jsonDictionary else {
            return
        }
        
        mapping(jsonDictionary: dictionary)
    }
    
    func mapping(jsonDictionary : [String : JSON]) {
        
        medium = jsonDictionary["image"]?["medium"].stringValue
        original = jsonDictionary["image"]?["original"].stringValue
    }
}
