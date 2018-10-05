//
//  Date+String.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import Foundation

extension Date{
    
    var formatted: String{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        let locale = Locale.current
        formatter.locale = locale
        return formatter.string(from: self)
    }
    
    init?(with dateText: String?){
        
        if (dateText == "") || (dateText == nil){
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = Constants.Formats.ISO8601
        
        //Try an official format ISO85601
        guard let dateFormat = formatter.date(from: dateText!) else{
            //Try another format
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            if let dateFormat1 = formatter.date(from: dateText!) {
                self.init(timeInterval: 0, since: dateFormat1)
                return
            }
            return nil
        }
        self.init(timeInterval: 0, since: dateFormat)
    }
}
