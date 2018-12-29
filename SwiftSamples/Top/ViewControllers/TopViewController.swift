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
    
    private func showSegmentedControlViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "SegmentedControl", bundle: nil).instantiateInitialViewController() as? UINavigationController else { return }
            guard let viewController = navigation.topViewController as? SegmentedControlViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showDateSampleViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "DateSample", bundle: nil).instantiateInitialViewController() as? UINavigationController else { return }
            guard let viewController = navigation.topViewController as? DateSampleViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showWKWebViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "WKWebView", bundle: nil).instantiateInitialViewController() as? UINavigationController else { return }
            guard let viewController = navigation.topViewController as? WKWebViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func showFacebookLoginViewController() {
        DispatchQueue.main.async {
            guard let navigation = UIStoryboard(name: "FacebookLogin", bundle: nil).instantiateInitialViewController() as? UINavigationController else { return }
            guard let viewController = navigation.topViewController as? FacebookLoginViewController else { return }
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
            case .dateToString:
                showDateSampleViewController()
            case .wkWebView:
                showWKWebViewController()
            case .facebookLogin:
                showFacebookLoginViewController()
            }
        case .advanced:
            print("advanced")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(44.0)
    }
}

