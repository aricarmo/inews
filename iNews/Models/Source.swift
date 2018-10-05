//
//  Source.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Source {
    var id: String
    var name: String
    
    init?(with json: JSON) {
        guard let id = json["id"].string, let name = json["name"].string else { return nil }
        self.id = id
        self.name = name
    }
}
