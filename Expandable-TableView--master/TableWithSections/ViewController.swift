//
//  ViewController.swift
//  TableWithSections
//
//  Created by IosDeveloper on 03/11/17.
//  Copyright © 2017 iOSDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlet for TableView
    @IBOutlet weak var mainTableView: UITableView!
    //Array for section and title names
    let section = [["title": "The Complete Android N/Ores Developer course[Udemy]", "subtitle": "0/1 Completed"], ["title": "PHP Basics", "subtitle": "0/3 Completed"], ["title": "AccessControl", "subtitle": "0/2 Completed"], ["title": "testing", "subtitle": "0/2 Completed"]]
    //Array for Items in sections
    let items = [["Content 0"], ["Content1", "Content2", "Content3"], ["Content1", "Content2"], ["Content1", "Content2"]]
    //Int that store index of opened Section while running
    var indexOpenedSection = -1
    
    //MARK:-----ViewDidLoad------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Seprators below Table as nil
        self.mainTableView.tableFooterView = UIView()
        
        //Registering cell of header
        mainTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        
    }
    
}

//MARK:-----TableView Methods------
extension ViewController : UITableViewDataSource,UITableViewDelegate {
    
    //setting number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    //Setting headerView Height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 100
        
    }
    //Setting Header Customised View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //Declare cell
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! TableViewCell
        
        //Setting Header Components
        
        //Handling Button Title
        headerCell.titleLabel.text = self.section[section]["title"]
        headerCell.subTitleLabel.text = self.section[section]["subtitle"]
        headerCell.ButtonToShowHide.tag = section
        
        if indexOpenedSection == section
        {
           headerCell.lblArrow.text = "^"
           headerCell.titleLabel.textAlignment = .center
           headerCell.subTitleLabel.textAlignment = .center
           headerCell.imgViewwidthConstraint.constant = 70;
        }
        else
        {
             headerCell.lblArrow.text = "v"
             headerCell.titleLabel.textAlignment = .left
             headerCell.subTitleLabel.textAlignment = .left
             headerCell.imgViewwidthConstraint.constant = 0;
        }
        
        //Adding a target to button
        headerCell.ButtonToShowHide.addTarget(self, action: #selector(ViewController.HandleheaderButton(sender:)), for: .touchUpInside)
        return headerCell.contentView
        
    }
    
    //Setting number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return items[section].count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let messageStr = String(format:"pass data here for %d section and %d",indexPath.section,indexPath.row+1)
        let alertController = UIAlertController(title: "Alert", message: messageStr, preferredStyle:.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default)
        { action -> Void in
            // Put your code here
        })
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //Setting cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //setting title
        cell.textLabel?.text = items[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexOpenedSection == indexPath.section
        {
            return 44
        }
        else
        {
            return 0
        }
    }
    
    //Header cell button Action
    @objc func HandleheaderButton(sender: UIButton){
        indexOpenedSection = sender.tag
        //reload section
        self.mainTableView.reloadData()
    }
}
