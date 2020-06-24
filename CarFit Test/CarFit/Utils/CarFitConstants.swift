//
//  CarFitConstants.swift
//  CarFit
//
//  Created by x218507 on 24/06/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation
class CarFitConstants: NSObject {
    // MARK: - Pointed Json file

    static let jsonFile = "carfit"

    // MARK: - Cleaner Task Status

    enum TaskStatus: String {
        case done = "Done"
        case todo = "ToDo"
        case inProgress = "InProgress"
        case rejected = "Rejected"
        case none = ""
    }
}
