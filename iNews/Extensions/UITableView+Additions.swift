//
//  UITableView+Additions.swift
//  iNews
//
//  Created by Allan on 05/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit

extension UITableView{
    
    enum CellType: String{
        case newsList = "NewsListTableViewCell"
        case featuredNews = "FeaturedNewsTableViewCell"
        case newsTitle = "NewsTitleTableViewCell"
        case newsImage = "NewsImageTableViewCell"
        case newsText = "NewsTextTableViewCell"
    }
    
    func registerCells(forFieldTypes types: [CellType]){
        for type in types{
            registerCellForType(type)
        }
    }
    
    func registerCellForType(_ type: CellType){
        self.register(UINib(nibName: type.rawValue, bundle: nil), forCellReuseIdentifier: type.rawValue)
    }
}
