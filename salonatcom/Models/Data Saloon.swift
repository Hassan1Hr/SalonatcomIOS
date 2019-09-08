//
//  Data Saloon.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/25/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit


struct allSaloons : Decodable {
    let code : Int
    let data : [onlySaloon]
}

struct onlySaloon : Decodable {
    let id : Int
    let name : String
    let image : String
    let area : dataArea
    let city : dataCity
}
struct dataArea : Decodable{
    let id : Int
    let name : String
}
struct dataCity : Decodable{
    let id : Int
    let area_id : String
    let name : String
}
