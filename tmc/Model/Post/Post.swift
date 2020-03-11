//
//  Post.swift
//  tmc
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import Foundation
import ObjectMapper

struct Post : Mappable {
    var userId : Int?
    var id : Int?
    var title : String?
    var body : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }

}
