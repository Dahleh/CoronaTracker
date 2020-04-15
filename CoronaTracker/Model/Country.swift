//
//  Country.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 3/23/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import Foundation


struct Country: Codable {
    public private(set) var lat: Double!
    public private(set) var lan: Double!
    public private(set) var country: String!
    public private(set) var flag: String!
    public private(set) var confirmed: String!
    public private(set) var deaths: String!
    public private(set) var recovered: String!
    public private(set) var todayCases: String!
    public private(set) var todayDeaths: String!
    public private(set) var critical: String!
    public private(set) var active: String!
    
}

struct Latest: Codable {
    public  var confirmed:String!
    public  var deaths:String!
    public  var recovered:String!
    
}


