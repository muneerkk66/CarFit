//
//  BaseVM.swift
//  CarFit
//
//  Created by x218507 on 24/06/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation
class BaseVM: NSObject {
    // MARK: - Common completetionblock for VM classes

    internal typealias VMDataCompletionBlock = (_ responseObject: Any?, _ errorObject: NSError?) -> Void
    internal typealias VMCompletionBlock = (_ errorObject: Error?) -> Void
}
