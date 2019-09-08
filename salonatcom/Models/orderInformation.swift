//
//  orderInformation.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/4/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

struct orderStatus : Decodable {
    let data : [orderselected]
    init?() {
        return nil
    }
}
struct orderselected : Decodable {
    let user_info : info
    let saloon_info : info
    let services : [services]
    let total_cost : String
    let total_minutes : String
    let created_at : String
    let reservation_date : String
    let reservation_time : String
    let end_time : String
    init?() {
        return nil
    }
}

struct services : Decodable {
    let image : String
    let service_duration : String
    let service_cost : String
    let name : String
    init?() {
        return nil
    }
}
