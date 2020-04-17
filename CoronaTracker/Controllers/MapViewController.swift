//
//  ViewController.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 3/23/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit
import GoogleMaps
import SwiftyJSON
import Alamofire

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var confirmedLbl: UILabel!
    @IBOutlet weak var deathsLbl: UILabel!
    @IBOutlet weak var recoveredLbl: UILabel!
    
    @IBOutlet weak var map: GMSMapView!
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gettingNumbers.instance.getAllNumbers{(success) in
            if success{
                print("Loaded")
                for item in gettingNumbers.instance.countries{
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: item.lat, longitude: item.lan)
                    marker.title = item.country
                    marker.snippet = "Confirmed: \(item.confirmed ?? "") Today Cases: \(item.todayCases ?? "") Deaths: \(item.deaths ?? "") Recovered: \(item.recovered ?? "") Critical: \(item.critical ?? "") Active: \(item.active ?? "")"
                    marker.map = self.map
                }
                
                //                self.confirmedLbl.text = "Confirmed: \(gettingNumbers.instance.latestData.confirmed ?? "")"
                //                self.deathsLbl.text = "Deaths: \(gettingNumbers.instance.latestData.deaths ?? "")"
                //                self.recoveredLbl.text = "Recovered: \(gettingNumbers.instance.latestData.recovered ?? "")"
            }else{
                print("not loaded")
            }
        }
        
        gettingNumbers.instance.getLatest{(success) in
            if success{
                self.confirmedLbl.text = "Confirmed: \(gettingNumbers.instance.latestData.confirmed ?? "")"
                self.deathsLbl.text = "Deaths: \(gettingNumbers.instance.latestData.deaths ?? "")"
                self.recoveredLbl.text = "Recovered: \(gettingNumbers.instance.latestData.recovered ?? "")"
            }
            else{
                print("Error")
            }
        }
        let camera = GMSCameraPosition.camera(withLatitude: 28.7041, longitude: 77.1025, zoom: 3.0)
        
        map.camera = camera
    }
    
   }

