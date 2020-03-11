//
//  ApiHelper.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//


import Alamofire
import ObjectMapper
import Toast_Swift

class ApiHelper {
    
    static let Instance = ApiHelper()

    func call(url: String, completion: @escaping (DataResponse<Any>) -> Void)  {
        Alamofire.request(url,
                          method: .get,
                          encoding: JSONEncoding.default)
            .responseJSON {(response) in
                completion(response)
        }
    }
    
}
