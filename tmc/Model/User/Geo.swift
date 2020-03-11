//
//  GeoCoordinates.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//
import Foundation
import ObjectMapper

struct Geo : Mappable {
    var lat : String?
    var lng : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        lat <- map["lat"]
        lng <- map["lng"]
    }

}
