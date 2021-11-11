//
//  String+Ext.swift
//  GHFollowers
//
//  Created by Riccardo on 09/11/21.
//

import Foundation

extension String {
    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "it_IT")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    var displayFormatDate: String {
        guard let date = self.date else { return "N/A" }
        return date.monthYearFormat
    }
}
