//
//  BadgeTableViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/12.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class BadgeTableViewController: UIViewController {
    
    enum RowType: Int, CaseIterable {
        case badgeCell
        case controlCell
    }
    
    struct CellIdentifier {
        static let badgeCell = "BadgeTableViewCell"
        static let controlCell = "BadgeTableControlCell"
    }
    
    struct NibName {
        static let badgeCell = "BadgeTableViewCell"
        static let controlCell = "BadgeTableControlCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    private var badgeCell: BadgeTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: NibName.badgeCell, bundle: nil), forCellReuseIdentifier: CellIdentifier.badgeCell)
        tableView.register(UINib(nibName: NibName.controlCell, bundle: nil), forCellReuseIdentifier: CellIdentifier.controlCell)
    }
    
}

extension BadgeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RowType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch indexPath.row {
        case RowType.badgeCell.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.badgeCell, for: indexPath) as? BadgeTableViewCell {
                cell.textLabel?.text = "Badge Cell"
                cell.textLabel?.textColor = UIColor.black
                self.badgeCell = cell
                return cell
            } else {
                cell = UITableViewCell()
                return cell
            }
        case RowType.controlCell.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.controlCell, for: indexPath) as? BadgeTableControlCell {
                cell.delegate = self
                return cell
            } else {
                cell = UITableViewCell()
                return cell
            }
        default:
            cell = UITableViewCell()
            return cell
        }
    }
}

extension BadgeTableViewController: BadgeTableControlCellDelegate {
    func didTapIncrease() {
        self.badgeCell?.increaseBadge()
    }
    
    func didTapDecrease() {
        self.badgeCell?.decreaseBadge()
    }
    
    
}
