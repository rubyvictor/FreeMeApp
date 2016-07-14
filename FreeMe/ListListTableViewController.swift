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

class ListListTableViewController: UITableViewController {
    
    var lists: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list1 = List()
        
        let item1 = Item(name: "Milk", itemState: false, itemCategory: .Bakery, quantity:2)
        list1.arrayOfItems.append(item1)
        let item2 = Item(name: "bread", itemState: false, itemCategory: .Bakery, quantity:4)
        list1.arrayOfItems.append(item2)
        
        list1.title = "Buy groceries or else...."
        
        self.lists.append(list1)
        
        self.tableView.reloadData()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listListTableViewCell", forIndexPath: indexPath) as! ListListTableViewCell
        
        let row = indexPath.row
        
        let list = lists[row]
        
        cell.listTitleLabel.text = list.title
        
        cell.listModificationTimeLabel.text = list.modificationTime.convertToString()
        
        return cell
    }
    
    //show segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier {
            if identifier == "displayList"{
                print("Table view cell tapped")
                
                let indexPath = tableView.indexPathForSelectedRow!
                
                let list = lists[indexPath.row]
                
                let displayListViewController = segue.destinationViewController as! DisplayListViewController
                
                displayListViewController.list = list
                
            }
            else if identifier == "addList" {
                print("+ button tapped")
                
            }
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            
        }
    }
    
    @IBAction func unwindToListListViewController(segue: UIStoryboardSegue){
        
    }
}