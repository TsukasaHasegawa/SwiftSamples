//
//  ViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2018/12/15.
//  Copyright © 2018 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Show Basic View
    
    private func showSegmentedControlViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "SegmentedControl", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let viewController = navigation.topViewController as? SegmentedControlViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showPickerTextFieldViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "PickerTextField", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let viewController = navigation.topViewController as? PickerTextFieldViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showScrollableTextFieldViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "ScrollableTextField", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let viewController = navigation.topViewController as? ScrollableTextFieldViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showDateSampleViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "DateSample", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let viewController = navigation.topViewController as? DateSampleViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showWKWebViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "WKWebView", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let viewController = navigation.topViewController as? WKWebViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showRealTimeObjectTrackingViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "RealTimeObjectTracking", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let viewController = navigation.topViewController as? RealTimeObjectTrackingViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showOverlayMatViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "OverlayMat", bundle: nil).instantiateInitialViewController() as? UINavigationController,
                let viewController = navigation.topViewController as? OverlayMatViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showEscapingRefererViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "EscapingReferer", bundle: nil).instantiateInitialViewController() as? UINavigationController,
                let viewController = navigation.topViewController as? EscapingRefererViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showVariableHeightTableViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "VariableHeightTable", bundle: nil).instantiateInitialViewController() as? UINavigationController,
                let viewController = navigation.topViewController as? VariableHeightTableViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // Mark: - Show Advance View
    
    private func showPagingTabMenuViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "PagingTabMenu", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let viewController = navigation.topViewController as? PagingTabMenuViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showCarouselViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "Carousel", bundle: nil).instantiateInitialViewController() as? UINavigationController,
                let viewController = navigation.topViewController as? CarouselViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // Mark: - Show Badge View
    
    private func showBadgeBarButtonItemViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "BadgeBarButtonItem", bundle: nil).instantiateInitialViewController() as? UINavigationController,
            let viewController = navigation.topViewController as? BadgeBarButtonItemViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showBadgeTableViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "BadgeTable", bundle: nil).instantiateInitialViewController() as? UINavigationController,
                let viewController = navigation.topViewController as? BadgeTableViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

}

extension TopViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Top.Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Top.sectionTitle(section: Top.Sections.allCases[section])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Top.Sections.allCases[section] {
        case .basic:
            return Top.BasicCell.allCases.count
        case .advanced:
            return Top.AdvancedCell.allCases.count
        case .badge:
            return Top.BadgeCell.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch Top.Sections.allCases[indexPath.section] {
        case .basic:
            cell.textLabel?.text = Top.basicCellTitle(cell: Top.BasicCell.allCases[indexPath.row])
            return cell
        case .advanced:
            cell.textLabel?.text = Top.advancedCellTitle(cell: Top.AdvancedCell.allCases[indexPath.row])
            return cell
        case .badge:
            cell.textLabel?.text = Top.badgeCellTitle(cell: Top.BadgeCell.allCases[indexPath.row])
            return cell
        }
    }
}

extension TopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch Top.Sections.allCases[indexPath.section] {
        case .basic:
            switch Top.BasicCell.allCases[indexPath.row] {
            case .segmentedControl:
                showSegmentedControlViewController()
            case .pickerTextField:
                showPickerTextFieldViewController()
            case .scrollableTextField:
                showScrollableTextFieldViewController()
            case .dateToString:
                showDateSampleViewController()
            case .wkWebView:
                showWKWebViewController()
            case .realTimeObjectTracking:
                showRealTimeObjectTrackingViewController()
            case .overlay:
                showOverlayMatViewController()
            case .escaping:
                showEscapingRefererViewController()
            case .variableHeightTable:
                showVariableHeightTableViewController()
            }
        case .advanced:
            switch Top.AdvancedCell.allCases[indexPath.row] {
            case .pagingTabMenu:
                showPagingTabMenuViewController()
            case .carousel:
                showCarouselViewController()
            }
        case .badge:
            switch Top.BadgeCell.allCases[indexPath.row] {
            case .barButtonItem:
                showBadgeBarButtonItemViewController()
            case .tableViewCell:
                showBadgeTableViewController()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(44.0)
    }
}

