
//  RealmHelper.swift
//  FreeMe

//  Created by Victor Lee on 11/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.


//import Foundation
//import RealmSwift
////
//class RealmHelper {
////    //static methods go here
////    
////    )
////    static func addList(list: List){
////        let realm = try! Realm()
////        try! realm.write(){
////            realm.add(list)
////        }
////    }
//    static func deleteList(list: List){
//        let realm = try! Realm()
//        try! realm.write {
//            realm.delete(list)
//        }
//    }
//    static func updateList(listToBeUpdated: List, newlist: List){
//        let realm = try! Realm()
//        try! realm.write {
//            listToBeUpdated.title = newlist.title
////            listToBeUpdated.item = newlist.item
//            listToBeUpdated.modificationTime = newlist.modificationTime
//            
//        }
//    }
//    
//    static func retrieveList() -> Results<List> {
//        let realm = try! Realm()
//        return realm.objects(List).sorted("modificationTime", ascending: false)
//    }
//    }
//}