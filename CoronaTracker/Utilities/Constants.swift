//
//  Constants.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 3/23/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

let BASE_URL_LOCAL = "https://corona.lmao.ninja/"
let COUNTRIES_URL = "countries"
let LATEST_URL = "all"

let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
  let NOTIF_CHANNELS_LOADED = Notification.Name("categoriesLoaded")
  let NOTIF_CHANNELS_SELECTED = Notification.Name("categoriesSelected")
