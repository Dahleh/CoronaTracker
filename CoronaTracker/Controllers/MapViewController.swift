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
        
        //self.showMarker(position: map.camera.target)
        // Do any additional setup after loading the view.
    }
    
//    func showMarker(position: CLLocationCoordinate2D){
//        let marker = GMSMarker()
//        marker.position = position
//        marker.title = "Delhi"
//        marker.snippet = "Capital of Delhi"
//        marker.map = map
//    }
    
//    func getAllNumbers(completion: @escaping CompletionHandler){
//        
//        AF.request("https://coronavirus-tracker-api.herokuapp.com/v2/locations", method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (respones) in
//            if respones.error == nil {
//                guard let data = respones.data else{return}
//                do{
//                    if let json = try JSON(data: data).array{
//                    for item in json {
//                        print("Here1")
//                        let lat = item["locations"]["coordinates"]["latitude"].floatValue
//                        let lan = item["locations"]["coordinates"]["longitude"].floatValue
//                        let countryName = item["locations"]["country"].stringValue
//                        let confirmed = item["locations"]["latest"]["confirmed"].stringValue
//                        let deaths = item["locations"]["latest"]["deaths"].stringValue
//                        let recovered = item["locations"]["latest"]["recovered"].stringValue
//                        let country = Country(lat: lat, lan: lan, country: countryName, confirmed: confirmed, deaths: deaths, recovered: recovered)
//                        print("Here2\(country)")
//                        countries.append(country)
//                                                
//                    }
//                        NotificationCenter.default.post(name: self.NOTIF_CHANNELS_LOADED, object: nil)
//                    completion(true)
//                }
//                } catch _ as NSError{
//                    print("error")
//                }
//            }else {
//                completion(false)
//                debugPrint(respones.error as Any)
//            }
//        }
//        
//    }


}

