//
//  displayListViewController.swift
//  FreeMe
//
//  Created by Victor Lee on 12/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit
import RealmSwift
import Foundation

class DisplayListViewController: UIViewController{
    
    @IBOutlet weak var listTitleTextField: UITextField!
    @IBOutlet weak var listItemTextField: UITextField!
    
    var list: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    func prepareForSeque(segue: UIStoryboardSegue, sender: AnyObject?) {
        let listListTableViewController = segue.destinationViewController as! ListListTableViewController
        if segue.identifier == "Save" {
            // if list exists, update title and content
            if let list = list {
                //1
                let newList = List()
                newList.title = listTitleTextField.text ?? ""
                newList.item = listItemTextField.text ?? ""
                RealmHelper.updateList(list, newlist: newList)
            } else {
                //if list does not exist, create new note
                let list = List()
                list.title = listTitleTextField.text ?? ""
                list.item = listItemTextField.text ?? ""
                list.modificationTime = NSDate()
                RealmHelper.addList(list)
            }
            listListTableViewController.lists = RealmHelper.retrieveList()
            
        }
        
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let list = list {
            listTitleTextField.text = list.title
            listItemTextField.text = list.item
        }
        else {
            
            listTitleTextField.text = ""
            listItemTextField.text = ""
        }
    }
    
}