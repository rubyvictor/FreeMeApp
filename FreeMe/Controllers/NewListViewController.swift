//
//  NewListViewController.swift
//  FreeMe
//
//  Created by Victor Lee on 19/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit

class NewListViewController: UITableViewController {
    
    
    @IBOutlet weak var newListTitleTextField: UITextField!
    
    @IBOutlet weak var listErrorLabel: UILabel!
    
    var list: [List] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let list = list {
//            
//            self.title = list.title
//            
//            
//            self.tableView.reloadData()
//        }
//        else {
//            
//        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    @IBAction func saveAction() {
        
        if isTextFieldBlank(newListTitleTextField) {
            listErrorLabel.text = "Enter list title"
            return
        }
        
        let newList = List()
        
        newList.title = "new grocery new list"
        
        self.list.append(newList)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func isTextFieldBlank(newListTitletextField: UITextField) -> Bool {
        
        let text = newListTitletextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if text == "" {
            
            return true
        }
        
        return false
    }
    
}