//
//  File.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/21/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit


struct Services : Decodable {
    let resultCount : Int
    let results : [serviceApp]
}

struct serviceApp : Decodable {
    let trackName : String
    let artworkUrl100 : String
}
