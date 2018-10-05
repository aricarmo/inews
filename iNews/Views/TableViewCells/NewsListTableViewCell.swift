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
        lblSubtitle.attributedText = NSAttributedString(string: news.title, attributes: lblSubtitle.attributedText!.attributes(at: 0, effectiveRange: nil))
        
        if let urlString = news.imageURL, let url = URL(string: urlString){
            imgViewNews.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: [], completed: nil)
        }
    }
}
