//
//  Item.swift
//  FreeMe
//
//  Created by Victor Lee on 14/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift


enum Category: Int {
    case Beverages = 1, Grains, Vegetables, CannedFood, Dairy, Baking, FrozenFood, Meat, Fruits, Toiletries, Seafood, DryFoods, Cleaning, BabyCare
}

class Item {
    
    var name: String = ""
    var itemState: Bool = false
    var itemCategory: Category = .Beverages
//    var quantity: Int
    var itemCount: Int
    
    init(name: String, itemState: Bool, itemCategory: Category, count: Int) {
        self.name = name
        self.itemState = itemState
        self.itemCategory = itemCategory
//        self.quantity = quantity
        self.itemCount = count
    }
    //TODO:  make it work then make it good.
    func categoryNameForCategoryNum() -> String {
        
        let cat = self.itemCategory
        
        if cat == .Beverages {
            
            return "Beverages"
        }
        else if cat == .Grains {
            
            return "Grains"
        }
        else if cat == .Vegetables{
            
            return "Vegetables"
        }
        else if cat == .CannedFood {
            return "CannedFood"
        }
        else if cat == .Dairy {
            return "Dairy"
        }
        else if cat == .Baking {
            return "Baking"
        }
        else if cat == .FrozenFood {
            return "FrozenFood"
        }
        else if cat == .Meat {
            return "Meat"
        }
        else if cat == .Fruits {
            return "Fruits"
        }
        else if cat == .Toiletries {
            return "Toiletries"
        }
        else if cat == .Seafood {
            return "Seafood"
        }
        else if cat == .DryFoods {
            return "DryFoods"
        }
        else if cat == .Cleaning {
            return "Cleaning"
        }
        else {
            return "BabyCare"
        }
    }
    
    //TODO: try a switch for better practice
    
    func integerForCategory() -> Int {
        
        let cat = self.itemCategory
        
        if cat == .Beverages {
            
            return 1
        }
        else if cat == .Grains {
            
            return 2
        }
        else if cat == .Vegetables{
            
            return 3
        }
        else if cat == .CannedFood {
            return 4
        }
        else if cat == .Dairy {
            return 5
        }
        else if cat == .Baking {
            return 6
        }
        else if cat == .FrozenFood {
            return 7
        }
        else if cat == .Meat {
            return 8
        }
        else if cat == .Fruits {
            return 9
        }
        else if cat == .Toiletries {
            return 10
        }
        else if cat == .Seafood {
            return 11
        }
        else if cat == .DryFoods {
            return 12
        }else if cat == .Cleaning {
            return 13
        }else {
            return 14
        }
    }

    
}