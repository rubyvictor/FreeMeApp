//
//  DisplayListViewController.swift
//  FreeMe
//
//  Created by Victor Lee on 14/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class DisplayListViewController: UITableViewController {
    
    dynamic var list: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let list = list {
            
            self.title = list.title
            
            self.tableView.reloadData()
        }
        else {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //TOFIX:
        
        self.tableView.reloadData()
        
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        header.textLabel!.font = UIFont.italicSystemFontOfSize(20)
        //boldSystemFontOfSize(20)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return list!.getNumberOfSections()
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list!.getHeaderFromSection(section)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return list!.getNumberOfRowsInSection(section)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemIdentifier", forIndexPath: indexPath) as! ItemTableViewCell
        
        let item = list!.getValueFromRow(indexPath)
        
        //assign property into instance cell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.mySwitch.on = item.itemState
        cell.setBackgroundColor()
        cell.itemNameLabel.text = item.name
        cell.item = item
        cell.list = list!
        cell.tableView = self.tableView
        
        //by doing this we are assigning a specific item to the cell's property
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToNewItemVC" {
            
            let newItemVC = segue.destinationViewController as! NewItemViewController
            newItemVC.list = list!
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            //change the model first to check for row numbers. Originally can delete one row in a section, but not a row in a 2-row section simultaneously.
//            let numberOfRows = list!.getNumberOfRowsInSection(indexPath.section)
            
            //now update the views
//            if numberOfRows > 1 {
//                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            } else {
//                let indexSet = NSMutableIndexSet()
//                indexSet.addIndex(indexPath.section)
//                tableView.deleteSections(indexSet, withRowAnimation: UITableViewRowAnimation.Fade)
//            }
            
            //Next, update the model before the view, because the view is based on the model
            list!.removeValueAtIndexPath(indexPath)
            
            tableView.reloadData()
            
        }
    }
}

