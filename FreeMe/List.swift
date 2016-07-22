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
    
    var arrayOfItems: [Item] = []
    var title: String = ""
    var modificationTime = NSDate()
    var count: Int {
        get {
// rely on the array count but still use custom get function
//            var sumCount = 0
//            for item in arrayOfItems {
//                sumCount += item.itemCount
//            }
            return arrayOfItems.count
        }
    }
}