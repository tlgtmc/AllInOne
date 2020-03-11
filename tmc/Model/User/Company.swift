//
//  Company.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import Foundation
import ObjectMapper

struct Company : Mappable {
    var name : String?
    var catchPhrase : String?
    var bs : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        name <- map["name"]
        catchPhrase <- map["catchPhrase"]
        bs <- map["bs"]
    }

}
