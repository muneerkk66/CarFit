//
//  HomeVM.swift
//  CarFit
//
//  Created by x218507 on 24/06/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation
import UIKit
class CleanerListVM: BaseVM {
    var dataHandler: CleanerListDataHandler = CleanerListDataHandler()
    var cleanerList = [Cleaner]()

    // MARK: - Method that returns list of Car Wash Objects

    func loadCleanerList() -> [Cleaner] {
        return dataHandler.loadAllCleanerList()
    }

    // MARK: - Method to get full name

    func getOwnerFullName(cleaner: Cleaner) -> String {
        return dataHandler.getOwnerFullName(cleaner)
    }

    // MARK: - Method to get full address

    func getFullAddress(cleaner: Cleaner) -> String {
        return dataHandler.getFullAddress(cleaner)
    }

    // MARK: - Method to get status color

    func getTaskStatusColor(status: String) -> UIColor {
        return dataHandler.getTaskStatusColor(status)
    }

    // MARK: - Method to get full task list as string

    func getTaskListString(cleaner: Cleaner) -> String {
        return dataHandler.getTaskListString(cleaner)
    }

    // MARK: - Method to get task time

    func getTaskTimeString(cleaner: Cleaner) -> String {
        return dataHandler.getTaskTime(cleaner)
    }

    // MARK: - Method to find the local time

    func getLocalTime(startTime: String) -> String {
        return startTime.UTCToLocalTime()
    }
}
