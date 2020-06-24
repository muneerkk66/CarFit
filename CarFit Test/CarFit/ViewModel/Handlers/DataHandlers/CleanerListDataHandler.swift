//
//  HomeDataHandler.swift
//  CarFit
//
//  Created by x218507 on 24/06/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import CoreLocation
import Foundation
import UIKit
class CleanerListDataHandler: NSObject {
    // MARK: - Fetch CarWash List

    func loadAllCleanerList() -> [Cleaner] {
        if let response = loadDataFromJson(fileName: CarFitConstants.jsonFile) {
            return response.data ?? []
        }
        return []
    }

    // MARK: - Get Owner full name => First name + Last name

    func getOwnerFullName(_ cleanerObj: Cleaner) -> String {
        return "\(cleanerObj.houseOwnerFirstName ?? "") \(cleanerObj.houseOwnerLastName ?? "")"
    }

    // MARK: - Get Status color based Color Extension

    func getTaskStatusColor(_ status: String) -> UIColor {
        switch status {
        case CarFitConstants.TaskStatus.done.rawValue:
            return UIColor.doneOption
        case CarFitConstants.TaskStatus.todo.rawValue:
            return UIColor.todoOption
        case CarFitConstants.TaskStatus.inProgress.rawValue:
            return UIColor.inProgressOption
        case CarFitConstants.TaskStatus.rejected.rawValue:
            return UIColor.rejectedOption
        default:
            return UIColor.white
        }
    }

    // MARK: - Get Task list combining with comma separator

    func getTaskListString(_ cleanerObj: Cleaner) -> String {
        return ((cleanerObj.tasks?.map { $0.title })! as! [String]).joined(separator: ", ")
    }

    // MARK: - Get Task start time

    func getTaskTime(_ cleanerObj: Cleaner) -> String {
        return "\(cleanerObj.tasks?.reduce(0) { $0 + ($1.timesInMinutes ?? 0) } ?? 0) min"
    }

    // MARK: - Owner full adress

    func getFullAddress(_ cleaner: Cleaner) -> String {
        return "\(cleaner.houseOwnerAddress ?? "") \(cleaner.houseOwnerZip ?? "") \(cleaner.houseOwnerCity ?? "")"
    }

    // MARK: - Load Json data

    fileprivate func loadDataFromJson(fileName: String) -> CleanerListResponse? {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let jsonResponse = try? decoder.decode(CleanerListResponse.self, from: data)
        else {
            return nil
        }
        return jsonResponse
    }
}
