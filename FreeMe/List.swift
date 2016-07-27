//
//  List.swift
//  FreeMe
//
//  Created by Victor Lee on 11/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift


class List: Object {
    
    
    
    
    var listDict : [String : [Item]] = ["Beverages": [], "Grains": [], "Vegetables": [], "CannedFood": [], "Dairy": [], "Baking": [], "FrozenFood": [], "Meat": [], "Fruits": [], "Toiletries": [], "Seafood":[], "DryFoods": [], "Cleaning": [], "BabyCare": [], "Auto": [], "Pets": []]
    
   
    
    
    var arrayOfItems: [Item] = []
    var title: String = ""
    
    var modificationTime = NSDate()
    var count: Int {
        get {
//             rely on the array count but still use custom get function
//            var sumCount = 0
//            for item in arrayOfItems {
//                sumCount += [item].count
//            }
            return arrayOfItems.count
        }
    }
    
    
    
    //create new func to calculate rows for display
//    func getListDictCount() -> Int {
//        
//            var sumDict = 0
//            for item in listDict.values {
//                sumDict += item.count
//            }
//        return sumDict
//    }
    
    //$0 refers to the object at hand.  Goin thru each element, element needs to be represented
    //Returns the header - which is a key in the dictionary - corresponding to the section number
    func getHeaderFromSection(section:Int) -> String{
        let mySortedKeys = getOrderedHeaders()
        return mySortedKeys[section]
    }
    // Look into the listDict.keys.filter and find values that are not empty and return the keys then sort them. well ordered == reliably.
    func getOrderedHeaders() -> [String] {
        return listDict.keys.filter {
            self.listDict[$0]?.count != 0
        } .sort()
        
    }
    //get the values from the section given
    func getValuesFromSection(section: Int) -> [Item] {
        return listDict[getHeaderFromSection(section)]!
    }
    
    func getValueFromRow(row: Int, section: Int) -> Item {
        let values = getValuesFromSection(section)
        return values[row]
        //Get the values corresponding to the section number
        //Get the specific Item from the value we just got
        //The specific Item will be represented by row
        
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        
        let rows = getValuesFromSection(section)
        return rows.count
    }
 
    func getNumberOfSections() -> Int {
        let numSections = getOrderedHeaders()
        return numSections.count
    }
    
    func addNewItem(item: Item) -> [Item] {
        if getOrderedHeaders().contains(item.categoryNameForCategoryNum()){
            listDict[item.categoryNameForCategoryNum()]?.append(item)
        } else {
            listDict[item.categoryNameForCategoryNum()]? = [item]
        }
        return [item]
    
    }
    //sum values from ALL sections
    func countItems() -> Int {
        //get all the section headers.
        //find all values in the dict using those headers and sum them up.
        
        var sumItems = 0
        for header in getOrderedHeaders() {
            sumItems += listDict[header]!.count
        }
        return sumItems
    }
    
    func removeItems() -> Int {
        
    }
    

}