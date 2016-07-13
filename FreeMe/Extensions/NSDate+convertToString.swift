//
//  NSDate+convertToString.swift
//  FreeMe
//
//  Created by Victor Lee on 13/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import Foundation

extension NSDate {
    func convertToString() -> String {
        return NSDateFormatter.localizedStringFromDate(self, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
    }
}
