//
//  listListTableViewController.swift
//  FreeMe
//
//  Created by Victor Lee on 12/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import Realm


class ListListTableViewController: UITableViewController {
    
    //add didSet here for reloadData() to solve the no-show on first add list.
    var lists: Results<List>? {
        didSet {
            
            for list in lists! {
                
                list.updateSelf()
            }
            
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add mixpanel analytics here to track open up addlist screen
        
        
//        Initial Test Data
//        let list1 = List()
//        let list2 = List()
//        
//        let item1 = Item(name: "Milk", itemState: false, itemCategory: .Bakery, quantity:2)
//        list1.arrayOfItems.append(item1)
//        
//        let item2 = Item(name: "bread", itemState: false, itemCategory: .Bakery, quantity:4)
//        list1.arrayOfItems.append(item2)
        
//        let item1 = Item(name: "Milk", itemState: false, itemCategory: .Dairy, count: 3)
//        list1.arrayOfItems.append(item1)
//        
//        let item2 = Item(name: "Bread", itemState: true, itemCategory: .Grains, count: 9)
//        list1.arrayOfItems.append(item2)
//        
//        list1.title = "Better buy groceries tonight!!"
//        
//        self.lists.append(list1)
//        
//        list2.title = "Better don't forget or else!!!"
//        
//        self.lists.append(list2)
        
        
    }

    override func viewDidAppear(animated: Bool) {
        
        lists = RealmHelper.retrieveList()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if lists == nil {
            return 0
        }
        return lists!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listListTableViewCell", forIndexPath: indexPath) as! ListListTableViewCell
        
        let row = indexPath.row
        
        let list = lists![row]
        list.updateSelf()
        
        cell.listTitleLabel.text = list.title
        
        cell.listModificationTimeLabel.text = list.modificationTime.convertToString()
        
        //call addItem func here
        //use interpolation to display quantity
        
//        cell.listNumberOfItemsLabel.text = "\(list.countItems()) items"
        cell.listNumberOfItemsLabel.text = "\(list.itemArray.count) items"
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    //Get quantity of items in arrayOfItems to display in the label
    
    
    //show segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier {
            
            if identifier == "displayList"{
                print("Table view cell tapped")
                
                let indexPath = tableView.indexPathForSelectedRow!
                
                let list = lists![indexPath.row]
                list.updateSelf()
                
                let displayListViewController = segue.destinationViewController as! DisplayListViewController
                
                displayListViewController.list = list
                
            }
            else if identifier == "addList" {
                print("+ button tapped")
                
                let newListViewController = segue.destinationViewController as! NewListViewController
                
                newListViewController.listListVC = self
                
            }
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //add "if.. else if" code here to delete the list or to show the delete button when swiped

            //TODO: Save deletion to Realm
            let deletedList = lists![indexPath.row]
            
            RealmHelper.deleteList(deletedList)
            
            //TODO: get all the lists, put them in our list array
            
//            lists = RealmHelper.retrieveList()
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            
        }
    }
    
    @IBAction func unwindToListListViewController(segue: UIStoryboardSegue){
        
    }
}