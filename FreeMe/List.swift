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

class List {
    
    var arrayOfItems: [Item] = []
    var title: String = ""
    var modificationTime = NSDate()
    var count: Int {
        get {
            var sumCount = 0
            for item in arrayOfItems {
                sumCount += item.itemCount
            }
            return sumCount
        }
    }
    
//    var quantity: Int {
//        get {
//            var sumQuantity = 0
//            for item in arrayOfItems {
//               sumQuantity += item.quantity
//            }
//            
//            return sumQuantity
//        }
//    }
}
