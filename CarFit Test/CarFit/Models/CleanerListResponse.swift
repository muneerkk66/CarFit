//
//  CarWashResponse.swift
//  CarFit
//
//  Created by x218507 on 24/06/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation
struct CleanerListResponse: Codable {
    let success: Bool?
    let message: String?
    let data: [Cleaner]?
    let code: Int?

    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
        case code
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([Cleaner].self, forKey: .data)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }
}
