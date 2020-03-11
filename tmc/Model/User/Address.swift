//
//  Address.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//


import Foundation
import ObjectMapper

struct Address : Mappable {
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
    var geo : Geo?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
        geo <- map["geo"]
    }

}
