//
//  ViewController.swift
//  Calendar
//
//  Test Project
//

import UIKit

class HomeViewController: UIViewController, AlertDisplayer {
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var calendarView: UIView!
    @IBOutlet var calendar: UIView!
    @IBOutlet var calendarButton: UIBarButtonItem!
    @IBOutlet var workOrderTableView: UITableView!
    var cleanerListVM = CleanerListVM()
    private let cellID = "HomeTableViewCell"
    private var refreshControl = UIRefreshControl()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCalendar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // MARK: - Fetch the latest carwash data details from json

        loadCarWashList()
    }

    fileprivate func loadCarWashList() {
        cleanerListVM.cleanerList = cleanerListVM.loadCleanerList()
    }

    // MARK: - Add calender to view

    private func addCalendar() {
        if let calendar = CalendarView.addCalendar(self.calendar) {
            calendar.delegate = self
        }
    }

    // MARK: - UI setups

    private func setupUI() {
        navBar.transparentNavigationBar()
        let nib = UINib(nibName: cellID, bundle: nil)
        workOrderTableView.register(nib, forCellReuseIdentifier: cellID)
        workOrderTableView.rowHeight = UITableView.automaticDimension
        workOrderTableView.estimatedRowHeight = 170

        // MARK: - Pull To Refresh

        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        workOrderTableView.addSubview(refreshControl)
    }

    // MARK: - Refresh method: It will end after 2 seconds

    @objc fileprivate func refresh(_: AnyObject) {
        workOrderTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let weakSelf = self else {
                return
            }
            weakSelf.refreshControl.endRefreshing()
        }
    }

    // MARK: - Show calendar when tapped, Hide the calendar when tapped outside the calendar view

    @IBAction func calendarTapped(_: UIBarButtonItem) {}
}

// MARK: - Tableview delegate and datasource methods

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return cleanerListVM.cleanerList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HomeTableViewCell
        let cleanerObj = cleanerListVM.cleanerList[indexPath.row]
        cell.loadCleanerDetails(cleanerObj)
        return cell
    }
}

// MARK: - Get selected calendar date

extension HomeViewController: CalendarDelegate {
    func getSelectedDate(_: String) {}
}
