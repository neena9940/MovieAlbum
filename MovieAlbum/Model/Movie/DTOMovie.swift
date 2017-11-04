//
//  DTOMovie.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/24/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTOMovie {
    
    var id:             Int64?
    var url:            String?
    var name:           String?
    var type:           String?
    var language:       String?
    var genres:         String?
    var status:         String?
    var runtime:        Double?
    var premiered:      Date?
    var officialSite:   String?
    var schedule:       DTOSchedule?
    var rating:         Double?//DTORating?
    var weight:         Int64?
    var network:        DTONetwork?
    var webChannel:     String?
    var externals:      DTOExternal?
    var image:          DTOImage?
    var summary:        String?
    var updated:        Int64?
    var _links:         String?
    
    init(jsonDictionary: [String : JSON]?) {
        // super.init()
        
        guard let dictionary = jsonDictionary else {
            return
        }
        
        mapping(jsonDictionary: dictionary)
    }
    
    func mapping(jsonDictionary : [String : JSON]) {
        
        id = jsonDictionary["id"]?.int64Value
        url = jsonDictionary["url"]?.stringValue
        name = jsonDictionary["name"]?.stringValue
        type = jsonDictionary["type"]?.stringValue
        language = jsonDictionary["language"]?.stringValue
        
        genres = jsonDictionary["genres"]?.array?.description
        
        status = jsonDictionary["status"]?.stringValue
        runtime = jsonDictionary["runtime"]?.doubleValue
        //premiered = jsonDictionary["premiered"]?.dateValue
        officialSite = jsonDictionary["officialSite"]?.stringValue
        //schedule
        rating = jsonDictionary["rating"]?["average"].doubleValue
        weight = jsonDictionary["weight"]?.int64Value
        //network
        webChannel = jsonDictionary["webChannel"]?.stringValue
        //externals
        image = DTOImage.init(jsonDictionary: jsonDictionary)
        summary = jsonDictionary["summary"]?.stringValue
        updated = jsonDictionary["updated"]?.int64Value
        _links = jsonDictionary["_links"]?.stringValue
        
    }
}
