//
//  ItemTableViewCell.swift
//  FreeMe
//
//  Created by Victor Lee on 14/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mySwitch: UISwitch!
    
//by declaring this property, i am allowed to hold an instance of Item
    var item: Item!
    
    func setBackgroundColor() {
        if mySwitch.on {
            contentView.backgroundColor = UIColor.lightGrayColor()
        }
        else {
            contentView.backgroundColor = UIColor.init(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1)
        }

    }
    
    
    @IBAction func switchClicked(sender: AnyObject) {
        if mySwitch.on {
            self.item.itemState = true
            contentView.backgroundColor = UIColor.lightGrayColor()
            //why not use cell.item.. because we ar already in the instance of itemtableVCell
        }else {
            self.item.itemState = false
            contentView.backgroundColor = UIColor.init(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1)
        }
    }
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    //smimilar to viewDidload, but for buttons
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
