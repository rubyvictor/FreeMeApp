
//  RealmHelper.swift
//  FreeMe

//  Created by Victor Lee on 11/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.


import Foundation
import RealmSwift

class RealmHelper {
    //static methods go here
    //realm can save array
    
    
    static func addList(list: List){
        let realm = try! Realm()
        try! realm.write(){
            realm.add(list)
        }
    }
    static func deleteList(list: List){
        let realm = try! Realm()
        try! realm.write {
            realm.delete(list)
        }
    }
    static func updateList(listToBeUpdated: List, newDict: [String : [Item]]){
        let realm = try! Realm()
        try! realm.write {
            listToBeUpdated.listDict = newDict
//            listToBeUpdated.arrayOfItems = .arrayOfItems
            listToBeUpdated.modificationTime = NSDate()
            
            
        }
    }
    
    static func retrieveList() -> Results<List> {
        let realm = try! Realm()
        return realm.objects(List).sorted("modificationTime", ascending: false)
    }
    }
