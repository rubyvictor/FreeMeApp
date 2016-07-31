//
//  CategoryCVCell.swift
//  FreeMe
//
//  Created by Victor Lee on 14/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override var selected: Bool{
        didSet{
            // Ternary function
            // var X = a ? b : c
            // Read as follows: X equals b if a is true, else X = c
//            self.backgroundColor = selected ? UIColor.yellowColor() : UIColor.whiteColor()
            
            if selected{
                
                backgroundColor = UIColor(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1)
                
            } else {
                backgroundColor = UIColor.clearColor()
            }
            
        }
    }
    
}
