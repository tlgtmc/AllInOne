//
//  User.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//
import Foundation
import ObjectMapper

struct User : Mappable {
    var id : Int?
    var name : String?
    var username : String?
    var email : String?
    var address : Address?
    var phone : String?
    var website : String?
    var company : Company?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        address <- map["address"]
        phone <- map["phone"]
        website <- map["website"]
        company <- map["company"]
    }

    func getAddressStr() -> String {
        var address  = self.address?.street!
            address! += ", "
            address! += (self.address?.suite!)!
            address! += ", "
            address! += (self.address?.city!)!
            address! += ", "
            address! += (self.address?.zipcode!)!
        
        return address!
    }
    
    func getCompanyStr() -> String {
        var company = (self.company!.bs)!
            company += "\n"
            company += (self.company!.catchPhrase)!
        
        return company
    }
}

