//
//  News.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import Foundation
import SwiftyJSON

struct News {
    
    enum NewsCellType {
        case title
        case image
        case text
    }
    
    private let kSource = "source"
    private let kTitle = "title"
    private let kDescription = "description"
    private let kContent = "content"
    private let kAuthor = "author"
    private let kURL = "url"
    private let kImageURL = "urlToImage"
    private let kPublishedAt = "publishedAt"
    
    var source: Source
    var author: String?
    var title: String
    var description: String
    var url: String?
    var imageURL: String?
    var publishedAt: Date?
    var content: String
    
    var hasImage: Bool{
        return self.imageURL != nil
    }
    
    var hasText: Bool{
        return self.content.count > 1
    }
    
    init?(with json: JSON) {
        guard let source = Source(with: json[kSource]), let title = json[kTitle].string, let description = json[kDescription].string, let content = json[kContent].string else { return nil }
        self.source = source
        self.title = title
        self.description = description
        self.content = content
        self.author = json[kAuthor].string
        self.url = json[kURL].string
        self.imageURL = json[kImageURL].string
        self.publishedAt = Date(with: json[kPublishedAt].string)
    }
}
