//
//  VariableHeightTableViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/02/16.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class VariableHeightTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "VariableHeightTableViewCell", bundle: nil), forCellReuseIdentifier: "VariableHeightTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension VariableHeightTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "コンテンツの高さによってセルの高さを変更する！"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VariableHeightTable.ContentType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VariableHeightTableViewCell") as! VariableHeightTableViewCell
        cell.label.text = VariableHeightTable.cellTitle(type: VariableHeightTable.ContentType.allCases[indexPath.row])
        return cell
    }
}

extension VariableHeightTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 100
        //UITableView.automaticDimensionでcellの高さを可変にする
        return UITableView.automaticDimension
    }
}
