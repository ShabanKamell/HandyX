//
// Created by mac on 12/5/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct ServiceRequest: Encodable {
    let sLatitude: String
    let sLongitude: String
    let serviceType: String
    let paymentMode: String
    let scheduleDate: String
    let scheduleTime: String
    let sAddress: String
    let questions: [QuestionAnswer]

    enum CodingKeys: String, CodingKey {
        case sLatitude = "s_latitude"
        case sLongitude = "s_longitude"
        case serviceType = "service_type"
        case paymentMode = "payment_mode"
        case scheduleDate = "schedule_date"
        case scheduleTime = "schedule_time"
        case sAddress = "s_address"
        case questions
    }
}