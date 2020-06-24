//
//  CalendarView.swift
//  Calendar
//
//  Test Project
//

import UIKit

protocol CalendarDelegate: class {
    func getSelectedDate(_ date: String)
}

class CalendarView: UIView {
    @IBOutlet var monthAndYear: UILabel!
    @IBOutlet var leftBtn: UIButton!
    @IBOutlet var rightBtn: UIButton!
    @IBOutlet var daysCollectionView: UICollectionView!

    private let cellID = "DayCell"
    weak var delegate: CalendarDelegate?

    // MARK: - Initialize calendar

    private func initialize() {
        let nib = UINib(nibName: cellID, bundle: nil)
        daysCollectionView.register(nib, forCellWithReuseIdentifier: cellID)
        daysCollectionView.delegate = self
        daysCollectionView.dataSource = self
    }

    // MARK: - Change month when left and right arrow button tapped

    @IBAction func arrowTapped(_: UIButton) {}
}

// MARK: - Calendar collection view delegate and datasource methods

extension CalendarView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DayCell
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt _: IndexPath) {}

    func collectionView(_: UICollectionView, didDeselectItemAt _: IndexPath) {}
}

// MARK: - Add calendar to the view

extension CalendarView {
    public class func addCalendar(_ superView: UIView) -> CalendarView? {
        var calendarView: CalendarView?
        if calendarView == nil {
            calendarView = UINib(nibName: "CalendarView", bundle: nil).instantiate(withOwner: self, options: nil).last as? CalendarView
            guard let calenderView = calendarView else { return nil }
            calendarView?.frame = CGRect(x: 0, y: 0, width: superView.bounds.size.width, height: superView.bounds.size.height)
            superView.addSubview(calenderView)
            calenderView.initialize()
            return calenderView
        }
        return nil
    }
}
