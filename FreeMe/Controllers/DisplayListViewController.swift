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
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        header.textLabel!.font = UIFont.italicSystemFontOfSize(20)
//        header.textLabel!.font = UIFont.case
        
        //boldSystemFontOfSize(20)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return 1
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
        
        let item = list!.getValueFromRow(indexPath.row, section: indexPath.section)
        
//        assign property into instance cell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
//        tableView.sectionHeaderHeight = 10
        
        
        cell.mySwitch.on = item.itemState
        
        cell.setBackgroundColor()
        
        cell.itemNameLabel.text = item.name

        
        cell.item = item //by doing this we are assigning a specific item to the cell's property
        
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
            let numberOfRows = list!.getNumberOfRowsInSection(indexPath.section)
            
            //Next, update the model before the view, because the view is based on the model
            list!.removeValueAtIndexPath(indexPath)
            
            //now update the views
            if numberOfRows > 1 {
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            } else {
                let indexSet = NSMutableIndexSet()
                indexSet.addIndex(indexPath.section)
                tableView.deleteSections(indexSet, withRowAnimation: UITableViewRowAnimation.Fade)
            }
            
        }
    }
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    

