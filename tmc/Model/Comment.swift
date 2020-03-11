//
//  Comment.swift
//  tmc
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import ObjectMapper

struct Comment : Mappable {
    var postId : Int?
    var id : Int?
    var name : String?
    var email : String?
    var body : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        postId <- map["postId"]
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        body <- map["body"]
    }

}
