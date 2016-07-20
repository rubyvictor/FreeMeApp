//
//  ItemTableViewCell.swift
//  FreeMe
//
//  Created by Victor Lee on 14/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mySwitch: UISwitch!
    
//by declaring this property, i am allowed to hold an instance of Item
    var item: Item!
    
    
    @IBAction func switchClicked(sender: AnyObject) {
        if mySwitch.on {
            self.item.itemState = false
            //why not use cell.item.. because we ar already in the instance of itemtableVCell
        }else {
            self.item.itemState = true
        }
    }
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
