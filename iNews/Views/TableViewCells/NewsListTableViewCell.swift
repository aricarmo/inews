//
//  NewsListTableViewCell.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit
import SDWebImage

final class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak private var imgViewNews: UIImageView!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(with news: News){
        lblTitle.text = news.source.name.uppercased()
        
        let font = UIFont(name: "OgloboAppCondensed-Semibold", size: 17.0)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.75
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        lblSubtitle.attributedText = NSAttributedString(string: news.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.font: font])
        
        if let urlString = news.imageURL, let url = URL(string: urlString){
            imgViewNews.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: [], completed: nil)
        }
    }
}
