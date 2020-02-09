//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/9/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM. yyyy"
        return dateFormatter.string(from: self)
    }
}
