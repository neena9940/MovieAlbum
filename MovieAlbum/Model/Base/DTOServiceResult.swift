////
////  DTOServiceResult.swift
////  MovieAlbum
////
////  Created by Nina Yousefi on 11/3/17.
////  Copyright © 2017 Nina Yousefi. All rights reserved.
////
//
//import Foundation
//import SwiftyJSON
//
//class DTOServiceResult: AnyObject {
//    
//    
//    var data: Any?
////
//    init?(json: Dictionary<String, JSON>) {
//        if let status = json["Status"]?.stringValue {
//            self.status = ServiceResultStatus(rawValue: status)
//        }
//        message = json["Message"]?.stringValue
//        additionalInfo = json["AdditionalInfo"]?.stringValue
//        
//        if let json = json["Data"]?.dictionaryValue {
//            extraData = DTOBaseServiceResult(json: json)
//        }
//    }
//}
//
//
//
