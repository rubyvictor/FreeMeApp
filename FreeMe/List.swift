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
import Realm


class List: Object {

    var listDict : [String : [Item]] = ["Beverages": [], "Grains": [], "Vegetables": [], "CannedFood": [], "Dairy": [], "Baking": [], "FrozenFood": [], "Meat": [], "Fruits": [], "Toiletries": [], "Seafood":[], "DryFoods": [], "Cleaning": [], "BabyCare": [], "Auto": [], "Pets": []]
    

    dynamic var title: String = ""
    dynamic var modificationTime = NSDate()

    //$0 refers to the object at hand.  Goin thru each element, element needs to be represented
    //Returns the header - which is a key in the dictionary - corresponding to the section number
    //call ReamHelper functions here to persis data for list items?
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
    
    //Get the values corresponding to the section number
    //Get the specific Item from the value we just got
    //The specific Item will be represented by row
    func getValueFromRow(row: Int, section: Int) -> Item {
        let values = getValuesFromSection(section)
        
        return values[row]
        
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
        RealmHelper.updateList(self, newDict: listDict)
        return [item]
    
    }
    //sum values from ALL sections
    //get all the section headers.
    //find all values in the dict using those headers and sum them up.
    func countItems() -> Int {
        var sumItems = 0
        for header in getOrderedHeaders() {
            sumItems += listDict[header]!.count
        }
        return sumItems
    }
    
    //Takes valid index path, removes item corresponding to that index path
    //go into key belonging to the section, and retrieve the value of that key
    //find the row for that value and then delete that row
    func removeValueAtIndexPath(indexPath: NSIndexPath) -> Item {
        return listDict[getHeaderFromSection(indexPath.section)]!.removeAtIndex(indexPath.row)
    }

}