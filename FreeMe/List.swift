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
    
    var itemArray: [Item] = []
    
    dynamic var itemArrayString: String = ""
    
    dynamic var title: String = ""
    dynamic var modificationTime = NSDate()
    
    func updateSelf() {
        
        itemArray = generateArrayFromString()
        generateListDict()
        
        print("list:\(self.title) updated itemArray:\(itemArray.count) and listDict:\(getOrderedHeaders())")
    }
    
    override class func ignoredProperties() -> [String] {
        
        return ["listDict", "itemArray"]
    }
    
    func generateArrayFromString() -> [Item] {
        
        var array: [Item] = []
        
        let items = itemArrayString.componentsSeparatedByString("|")
        
        for item in items {
            
            let anItem = item.componentsSeparatedByString(";")
            
            if anItem.count != 3 {
                break
            }
            
            let itemName = anItem[0]
            let itemStateString = anItem[1]
            let itemCategoryString = anItem[2]
            
            var itemState = false
            if itemStateString == "true" {
                itemState = true
            }
            
            let itemCategoryNum = Int(itemCategoryString)
            let itemCategory = Item.categoryForInteger(itemCategoryNum!)
            
            let newItem = Item(name: itemName, itemState: itemState, itemCategory: itemCategory)
            
            array.append(newItem)
        }
        
        return array
    }
    
    func generateItemArrayStringFromArray() {
        
        var newItemArrayString = ""
        
        for item in itemArray {
            
            let itemString = itemStringFromItem(item)
            
            if newItemArrayString != "" {
                newItemArrayString.appendContentsOf("|")
            }
            
            newItemArrayString.appendContentsOf(itemString)
        }
        
        RealmHelper.updateList(self, title: self.title, itemArrayString: newItemArrayString)
        
        updateSelf()
    }
    
    func generateListDict() {
        
        emptyListDictArrays()
        
        for item in itemArray {
            listDict[Item.categoryNameForCategoryNum(item.itemCategory)]?.append(item)
        }
    }
    
    func emptyListDictArrays() {
        
        let allKeys = listDict.keys
        
        for key in allKeys {
            
            listDict[key] = []
        }
    }
    
    func itemStringFromItem(item: Item) -> String {
        
        var itemStateString = ""
        
        if item.itemState == true {
            
            itemStateString = "true"
        }
        else {
            
            itemStateString = "false"
        }
        
        let itemCategoryNumString = "\(Item.integerForCategory(item.itemCategory))"
        
        let newItemString = "\(item.name);\(itemStateString);\(itemCategoryNumString)"
        
        print("current state: \(item.itemState)")
        print("Updating: \(newItemString)")
        
        return newItemString
    }
    
    func addNewItem(item: Item) {
        
        itemArray.append(item)
        
        let newItemString = itemStringFromItem(item)
        
        var newItemArrayString = itemArrayString
        
        if newItemArrayString != "" {
            newItemArrayString.appendContentsOf("|")
        }
        
        newItemArrayString.appendContentsOf(newItemString)
        
        RealmHelper.updateList(self, title: self.title, itemArrayString: newItemArrayString)
        
        updateSelf()
    }
    
    func updateList() {
        
        generateItemArrayStringFromArray()
    }
    
    // Look into the listDict.keys.filter and find values that are not empty and return the keys then sort them. well ordered == reliably.
    
    func getOrderedHeaders() -> [String] {
        
        return listDict.keys.filter {
            self.listDict[$0]?.count != 0
            } .sort()
    }

    //$0 refers to the object at hand.  Goin thru each element, element needs to be represented
    //Returns the header - which is a key in the dictionary - corresponding to the section number
    //call ReamHelper functions here to persis data for list items?
    func getHeaderFromSection(section:Int) -> String {
        
        let mySortedKeys = getOrderedHeaders()
        
        return mySortedKeys[section]
    }
    
    //get the values from the section given
    func getValuesFromSection(section: Int) -> [Item] {
        
        return listDict[getHeaderFromSection(section)]!
    }
    
    //Get the values corresponding to the section number
    //Get the specific Item from the value we just got
    //The specific Item will be represented by row
    func getValueFromRow(indexPath: NSIndexPath) -> Item {
        
        let values = getValuesFromSection(indexPath.section)
        
        print("requesting info for row: \(values[indexPath.row].name))")
        
        return values[indexPath.row]
        
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        
        let rows = getValuesFromSection(section)
        
        return rows.count
    }
 
    func getNumberOfSections() -> Int {
        
        let numSections = getOrderedHeaders()
        
        return numSections.count
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
    
    func removeValueAtIndexPath(indexPath: NSIndexPath) {

        let item = self.getValueFromRow(indexPath)
        removeItemFromItemArray(item)
        listDict[getHeaderFromSection(indexPath.section)]!.removeAtIndex(indexPath.row)
        
        updateList()
    }
    
    func removeItemFromItemArray(item: Item) {
        
        var indexOfItemToBeRemoved: Int = -1
        
        for anItem in itemArray {
            
            if item.itemCategory == anItem.itemCategory && item.name == anItem.name {
                
                indexOfItemToBeRemoved = itemArray.indexOf(anItem)!
                break
            }
        }
        
        if indexOfItemToBeRemoved >= 0 {
            itemArray.removeAtIndex(indexOfItemToBeRemoved)
        }
        
    }

}