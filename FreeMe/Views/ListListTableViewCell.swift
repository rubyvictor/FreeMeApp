//
//  ListListTableViewCell.swift
//  FreeMe
//
//  Created by Victor Lee on 12/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import Realm


class ListListTableViewCell: UITableViewCell {
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var listModificationTimeLabel: UILabel!
    @IBOutlet weak var listNumberOfItemsLabel: UILabel!
}
