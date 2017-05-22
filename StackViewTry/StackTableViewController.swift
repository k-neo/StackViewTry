//
//  StackTableViewController.swift
//  StackViewTry
//
//  Created by 秋本大介 on 2017/05/20.
//  Copyright © 2017年 秋本大介. All rights reserved.
//

import UIKit

class StackTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension

        self.tableView.register(UINib(nibName: "StackTableViewCell", bundle: nil), forCellReuseIdentifier: "StackTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StackTableViewCell", for: indexPath) as! StackTableViewCell

        let imageFileName = NSString(format: "test_%02d", indexPath.row + 1) as String
        cell.descriptionTextLabel.numberOfLines = 0

        let image = UIImage(named: imageFileName)
        cell.setImageWithWidth(width: tableView.frame.width, image: image!)

        if indexPath.row % 2 == 0 {
            cell.titleLabel.text = "Odd"
            cell.descriptionTextLabel.text = "1234567890"
        } else {
            cell.titleLabel.text = "Even"
            cell.descriptionTextLabel.text = "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
        }

        return cell
    }
}
