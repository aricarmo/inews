//
//  NewsTitleTableViewCell.swift
//  iNews
//
//  Created by Allan on 05/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblSubtitle: UILabel!
    @IBOutlet weak private var lblAuthor: UILabel!
    @IBOutlet weak private var lblDateTime: UILabel!
    
    @IBOutlet weak private var imgViewNews: UIImageView!
    @IBOutlet weak private var lblImageSubtitle: UILabel!
    
    @IBOutlet weak private var lblText: UILabel!
    
    private var imageToPreview: ((UIImageView) -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(with news: News, and cellType: UITableView.CellType, imageToPreview: ((_ image: UIImageView) -> Void)?){
        self.imageToPreview = imageToPreview
        switch cellType {
        case .newsTitle: setupTitle(with: news)
        case .newsImage: setupImage(with: news)
        case .newsText: setupText(with: news)
        default: break
        }
    }
    
    private func setupTitle(with news: News){
        
        let fontTitle = UIFont(name: "OgloboAppCondensed-Semibold", size: 30.0)!
        let paragraphStyleTitle = NSMutableParagraphStyle()
        paragraphStyleTitle.lineHeightMultiple = 0.75
        paragraphStyleTitle.alignment = .center
        paragraphStyleTitle.lineBreakMode = .byWordWrapping
        
        lblTitle.attributedText = NSAttributedString(string: news.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyleTitle,NSAttributedString.Key.font: fontTitle, NSAttributedString.Key.foregroundColor: Constants.Colors.BlueText])
        
        
        let fontSubtitle = UIFont(name: "OgloboAppCondensed", size: 22.0)!
        let paragraphStyleSubtitle = NSMutableParagraphStyle()
        paragraphStyleSubtitle.lineHeightMultiple = 0.75
        paragraphStyleSubtitle.alignment = .center
        paragraphStyleSubtitle.lineBreakMode = .byWordWrapping
        
        lblSubtitle.attributedText = NSAttributedString(string: news.description, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyleSubtitle,NSAttributedString.Key.font: fontSubtitle, NSAttributedString.Key.foregroundColor: Constants.Colors.BlueText])
        
        if let date = news.publishedAt{
            lblDateTime.text = date.formatted
        }
        lblDateTime.isHidden = news.publishedAt == nil
        
        let author = news.author ?? news.source.name
        let formattedAuthor = NSMutableAttributedString(string: "Por \(author)")
        formattedAuthor.addAttributes([NSAttributedString.Key.foregroundColor: Constants.Colors.BlueAuthorPor, NSAttributedString.Key.font: UIFont(name: "OgloboAppCondensed-Medium", size: 12.0)!], range: NSMakeRange(0, 3))
        formattedAuthor.addAttributes([NSAttributedString.Key.foregroundColor: Constants.Colors.BlueAuthorName, NSAttributedString.Key.font: UIFont(name: "OgloboAppCondensed-Semibold", size: 12.0)!], range: NSMakeRange(4, author.count))
        
        lblAuthor.attributedText = formattedAuthor
    }
    
    private func setupImage(with news: News){
        if let urlString = news.imageURL, let url = URL(string: urlString){
            imgViewNews.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: [], completed: nil)
            
            //Enable tap to preview image
            if imageToPreview != nil{
                let tap = UITapGestureRecognizer(target: self, action: #selector(previewImage(_:)))
                imgViewNews.addGestureRecognizer(tap)
                imgViewNews.isUserInteractionEnabled = true
            }
        }
        lblImageSubtitle.text = "Fonte: \(news.author ?? news.source.name)"
    }
    
    private func setupText(with news: News){
        let fontTitle = UIFont(name: "Georgia", size: 18.0)!
        let paragraphStyleTitle = NSMutableParagraphStyle()
        paragraphStyleTitle.lineHeightMultiple = 1.3
        paragraphStyleTitle.alignment = .left
        paragraphStyleTitle.lineBreakMode = .byWordWrapping
        
        lblText.attributedText = NSAttributedString(string: news.content, attributes: [
            NSAttributedString.Key.paragraphStyle: paragraphStyleTitle,
            NSAttributedString.Key.font: fontTitle,
            NSAttributedString.Key.foregroundColor: UIColor.black
            ])
    }
    
    @objc private func previewImage(_ gesture: UITapGestureRecognizer){
        self.imageToPreview?(self.imgViewNews)
    }

}
