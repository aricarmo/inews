//
//  Date+String.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import Foundation

extension Date{
    init(with dateText: String?) {
        
        if (dateText == "") || (dateText == nil){
            self.init()
        }
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        /*formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        
        if let date = formatter.date(from: dateText!) {
            self.init()
        }*/
        
        formatter.dateFormat = Constants.Formats.ISO8601
        
        if let date = formatter.date(from: dateText!) {
            self.init(timeInterval: 0, since: date)
        }
        
        self.init()
        
        
    }
}
