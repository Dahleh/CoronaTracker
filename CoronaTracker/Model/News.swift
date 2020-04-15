//
//  News.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/13/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import Foundation

struct News: Codable {
    public private(set) var title: String!
    public private(set) var link: String!
    public private(set) var content: String!
    public private(set) var url: String!
}
