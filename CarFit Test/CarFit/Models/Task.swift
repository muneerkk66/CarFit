//
//  Task.swift
//  CarFit
//
//  Created by x218507 on 24/06/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation
struct Task: Codable {
    let taskId: String?
    let title: String?
    let isTemplate: Bool?
    let timesInMinutes: Int?
    let price: Double?
    let paymentTypeId: String?
    let createDateUtc: String?
    let lastUpdateDateUtc: String?
    let paymentTypes: String?

    enum CodingKeys: String, CodingKey {
        case taskId
        case title
        case isTemplate
        case timesInMinutes
        case price
        case paymentTypeId
        case createDateUtc
        case lastUpdateDateUtc
        case paymentTypes
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        taskId = try values.decodeIfPresent(String.self, forKey: .taskId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        isTemplate = try values.decodeIfPresent(Bool.self, forKey: .isTemplate)
        timesInMinutes = try values.decodeIfPresent(Int.self, forKey: .timesInMinutes)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        paymentTypeId = try values.decodeIfPresent(String.self, forKey: .paymentTypeId)
        createDateUtc = try values.decodeIfPresent(String.self, forKey: .createDateUtc)
        lastUpdateDateUtc = try values.decodeIfPresent(String.self, forKey: .lastUpdateDateUtc)
        paymentTypes = try values.decodeIfPresent(String.self, forKey: .paymentTypes)
    }
}
