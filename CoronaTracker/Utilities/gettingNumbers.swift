//
//  gettingNumbers.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 3/23/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class gettingNumbers {
    static let instance = gettingNumbers()
    
    var countries = [Country]()
    var latestData = Latest()
    func getAllNumbers(completion: @escaping CompletionHandler){
        
        AF.request("https://corona.lmao.ninja/countries", method: .get, encoding: JSONEncoding.default).responseJSON { (respones) in
            switch respones.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                for item in json.arrayValue{
                    //print("Here1")
                    let lat = item["countryInfo"]["lat"].doubleValue
                    let lan = item["countryInfo"]["long"].doubleValue
                    let flag = item["countryInfo"]["flag"].stringValue
                    let countryName = item["country"].stringValue
                    let confirmed = item["cases"].stringValue
                    let deaths = item["deaths"].stringValue
                    let recovered = item["recovered"].stringValue
                    let todayCases = item["todayCases"].stringValue
                    let todayDeaths = item["todayDeaths"].stringValue
                    let critical = item["critical"].stringValue
                    let active = item["active"].stringValue
                    let country = Country(lat: lat, lan: lan, country: countryName, flag: flag, confirmed: confirmed, deaths: deaths, recovered: recovered, todayCases: todayCases, todayDeaths: todayDeaths, critical: critical, active: active)
                    print("Here2\(country)")
                    self.countries.append(country)
                }
                //let latest = json["latest"]
//                self.latestData.confirmed = json["latest"]["confirmed"].stringValue
//                self.latestData.deaths = json["latest"]["deaths"].stringValue
//                self.latestData.recovered = json["latest"]["recovered"].stringValue
                
                print(self.countries)
                completion(true)
                
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
        
    }
    
    func getLatest(completion: @escaping CompletionHandler){
        var latest = Latest()
        AF.request("https://corona.lmao.ninja/all", method: .get, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                    latest.confirmed = json["cases"].stringValue
                    latest.deaths = json["deaths"].stringValue
                    latest.recovered = json["recovered"].stringValue
                    self.latestData = latest
                
                completion(true)
                
                
            case .failure(let error):
                print(error)
                completion(false)
                
            }
        }
        
        
    }
    
        
}


