//
//  DTOSchedule.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/24/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTOSchedule{
    
    var time: String?
    var days: [String]?
   
    init(jsonDictionary: [String : JSON]?) {
       // super.init()
        
        guard let dictionary = jsonDictionary else {
            return
        }
        
        mapping(jsonDictionary: dictionary)
    }
    
    func mapping(jsonDictionary : [String : JSON]) {
        
        time = jsonDictionary["time"]?.stringValue
        //days = jsonDictionary["days"]?.arrayValue
    }
}
