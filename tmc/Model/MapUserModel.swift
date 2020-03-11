//
//  MapUserModel.swift
//  tmc
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import MapKit

class MapUserModel: NSObject, MKAnnotation {
    let user: User?
    let title: String?
    let coordinate: CLLocationCoordinate2D
  
    init(user: User) {
        self.user = user
        self.title = user.username
        self.coordinate = CLLocationCoordinate2D(latitude: Double((user.address?.geo?.lat)!)!, longitude: Double((user.address?.geo?.lat)!)!)
    
        super.init()
    }

    func getPointName() -> String {
        (self.user?.name)!
    }

    
}
