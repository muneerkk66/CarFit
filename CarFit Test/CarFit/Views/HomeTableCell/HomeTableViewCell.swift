//
//  HomeTableViewCell.swift
//  Calendar
//
//  Test Project
//

import CoreLocation
import UIKit

class HomeTableViewCell: UITableViewCell {
    var cleanerListVM = CleanerListVM()
    @IBOutlet var bgView: UIView!
    @IBOutlet var customerLabel: UILabel!
    @IBOutlet var statusView: UIView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var tasksLabel: UILabel!
    @IBOutlet var arrivalTimeLabel: UILabel!
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var timeRequiredLabel: UILabel!
    @IBOutlet var distance: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 10.0
        statusView.layer.cornerRadius = statusLabel.frame.height / 2.0
        statusView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }

    func loadCleanerDetails(_ cleanerObj: Cleaner) {
        customerLabel.text = cleanerListVM.getOwnerFullName(cleaner: cleanerObj)
        destinationLabel.text = cleanerObj.houseOwnerAddress
        statusView.backgroundColor = cleanerListVM.getTaskStatusColor(status: cleanerObj.visitState ?? CarFitConstants.TaskStatus.none.rawValue)
        statusLabel.text = cleanerObj.visitState
        timeRequiredLabel.text = cleanerListVM.getTaskTimeString(cleaner: cleanerObj)
        tasksLabel.text = cleanerListVM.getTaskListString(cleaner: cleanerObj)
        arrivalTimeLabel.text = cleanerListVM.getLocalTime(startTime: cleanerObj.startTimeUtc ?? "")
    }
}
