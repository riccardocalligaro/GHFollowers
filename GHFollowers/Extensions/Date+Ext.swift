//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Riccardo on 09/11/21.
//

import Foundation

extension Date {
    var monthYearFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
