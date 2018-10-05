//
//  Constants.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Formats {
        static let ISO8601 = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
    }
    
    struct Colors {
        static let NavigationBar = UIColor(red: 0/255, green: 90/255, blue: 150/255, alpha: 1)
        static let BlueText = UIColor(red: 25/255, green: 51/255, blue: 76/255, alpha: 1)
        static let BlueAuthorPor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
        static let BlueAuthorName = UIColor(red: 30/255, green: 150/255, blue: 200/255, alpha: 1)
    }
    
    struct URLs{
        static let APITeste = "https://s3.glbimg.com/v1/AUTH_0a546877ae934340a12a639673da6690/010bf5/challenge/news/api/content.json"
    }
    
}
