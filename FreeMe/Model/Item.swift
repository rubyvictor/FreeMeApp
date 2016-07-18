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
    case Beverages = 1, Grains, Vegetables, CannedFood, Dairy, Baking, FrozenFood, Meat, Fruits, Toiletries, Seafood, DryFoods, BabyCare
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
    
    
    
}