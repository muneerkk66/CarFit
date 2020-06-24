//
//  BaseDataHandler.swift
//  CarFit
//
//  Created by x218507 on 24/06/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation
class BaseDataHandler: NSObject {
    // MARK: - Common completetionblock for DataHandler classes

    internal typealias DataHandlerCompletionBlock = (_ errorObject: NSError?) -> Void
}
