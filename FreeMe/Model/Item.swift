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
import Realm

//FIX dictionary: how to use var category: String instead?
enum Category: String {
    case Beverages, Grains, Vegetables, CannedFood, Dairy, Baking, FrozenFood, Meat, Fruits, Toiletries, Seafood, DryFoods, Cleaning, BabyCare, Auto, Pets
}

class Item: Object {
    
    dynamic var name: String = ""
    dynamic var itemState: Bool = false
    var itemCategory: Category = .Beverages
    //FIX dictionary: use new var category of type String?
//    var category: String
//    dynamic var itemCount: Int = 0
    
    //FIX dictionary: add category into init function?
    init(name: String, itemState: Bool, itemCategory: Category) {
        self.name = name
        self.itemState = itemState
        self.itemCategory = itemCategory
//FIX dictionary: init category?
//        self.category = category
//        self.itemCount = count
        
        super.init()
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: AnyObject, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    class func categoryNameForCategoryNum(cat: Category) -> String {
        
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
        else if cat == .BabyCare {
            return "BabyCare"
        }
        else if cat == .Auto {
            return "Auto"
        }
        else {
            return "Pets"
        }
    }
    
    class func integerForCategory(cat: Category) -> Int {
        
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
        }
        else if cat == .Cleaning {
            return 13
        }
        else if cat == .BabyCare {
            return 14
        }
        else if cat == .Auto {
            return 15
        }
        else {
            return 16
        }
    }
    
    class func categoryForInteger(integer: Int) -> Category {
        
        if integer == 1 {
            
            return .Beverages
        }
        else if integer == 2 {
            
            return .Grains
        }
        else if integer == 3 {
            
            return .Vegetables
        }
        else if integer == 4 {
            
            return .CannedFood
        }
        else if integer == 5 {
            
            return .Dairy
        }
        else if integer == 6 {
            
            return .Baking
        }
        else if integer == 7 {
            
            return .FrozenFood
        }
        else if integer == 8 {
            
            return .Meat
        }
        else if integer == 9 {
            
            return .Fruits
        }
        else if integer == 10 {
            
            return .Toiletries
        }
        else if integer == 11 {
            
            return .Seafood
        }
        else if integer == 12 {
            
            return .DryFoods
        }
        else if integer == 13 {
            
            return .Cleaning
        }
        else if integer == 14 {
            
            return .BabyCare
        }
        else if integer == 15 {
            
            return .Auto
        }
        else {
            
            return .Pets
        }
        
    }

    
}