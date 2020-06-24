//
//  DayCell.swift
//  Calendar
//
//  Test Project
//

import UIKit

class DayCell: UICollectionViewCell {
    @IBOutlet var dayView: UIView!
    @IBOutlet var day: UILabel!
    @IBOutlet var weekday: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        dayView.layer.cornerRadius = dayView.frame.width / 2.0
        dayView.backgroundColor = .clear
    }
}
