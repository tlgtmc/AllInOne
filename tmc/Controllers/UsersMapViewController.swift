//
//  UsersMapViewController.swift
//  tmc
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import UIKit
import MapKit

class UsersMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var userList: [User] = []
    var userPointList: [MapUserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userList)
        mapView.delegate = self
        
        for user in userList {
            userPointList.append(MapUserModel(user: user))
        }
        mapView.addAnnotations(userPointList)
    }
    
    func setUsers(users: [User]) {
        self.userList = users
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension UsersMapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard let annotation = annotation as? MapUserModel else { return nil }

        let identifier = "marker"
        var view: MKMarkerAnnotationView

        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = annotation.user?.name
            view.detailCalloutAccessoryView = detailLabel
            
        }
        return view
    }
}
