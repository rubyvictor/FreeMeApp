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
    
    dynamic var title = ""
    dynamic var item = ""
    dynamic var modificationTime = NSDate()
    
}
