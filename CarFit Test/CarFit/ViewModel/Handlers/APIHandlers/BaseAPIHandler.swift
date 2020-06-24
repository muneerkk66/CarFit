//
//  BaseAPIHandler.swift
//  CarFit
//
//  Created by x218507 on 24/06/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation
class BaseAPIHandler: NSObject {
    // MARK: - Common completetionblock for API classes

    internal typealias ApiCompletionBlock = (_ responseObject: AnyObject?, _ errorObject: NSError?) -> Void
}
