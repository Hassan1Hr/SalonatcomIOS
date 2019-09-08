//
//  Orders.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/3/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
struct MyOrdersdata : Decodable {
    let data : [holdOrders]
}
struct holdOrders : Decodable {
    let reservation_date : String
    let user_info : info
    let saloon_info : info
    let id : Int
    let status : String
}
struct info : Decodable {
    let name : String
    let phone : String
}
