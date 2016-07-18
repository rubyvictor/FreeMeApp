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


enum Category: String {
    case Beverages = "Beverages", Grains = "Grains", CannedFood = "CannedFood", Dairy = "Dairy", Vegetables = "Vegetables", FrozenFood = "FrozenFood", Meat = "Meat", Fruits = "Fruits", SeaFood = "SeaFood", DryFood = "DryFood", Toiletries = "Toiletries", BabyCare = "BabyCare"
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