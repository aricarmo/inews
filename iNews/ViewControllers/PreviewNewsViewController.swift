//
//  PreviewNewsViewController.swift
//  iNews
//
//  Created by Allan on 05/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit

final class PreviewNewsViewController: BaseViewController {
    
    @IBOutlet weak private var lblSection: UILabel!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblSubtitle: UILabel!
    @IBOutlet weak private var lblTexto: UILabel!
    @IBOutlet weak private var lblReadingTime: UILabel!
    @IBOutlet weak private var imgNews: UIImageView!
    @IBOutlet weak private var constraintLeadingTitle: NSLayoutConstraint!
    
    var currentNews: News!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupInterface() {
        super.setupInterface()
        self.lblSection.text = currentNews.source.name.uppercased()
        
        let fontTitle = UIFont(name: "OgloboAppCondensed-Semibold", size: 22.0)!
        let paragraphStyleTitle = NSMutableParagraphStyle()
        paragraphStyleTitle.lineHeightMultiple = 0.75
        paragraphStyleTitle.alignment = .left
        paragraphStyleTitle.lineBreakMode = .byWordWrapping
        
        lblTitle.attributedText = NSAttributedString(string: currentNews.title, attributes: [
            NSAttributedString.Key.paragraphStyle: paragraphStyleTitle,
            NSAttributedString.Key.font: fontTitle,
            NSAttributedString.Key.foregroundColor: Constants.Colors.BlueText])
        
        let fontSubtitle = UIFont(name: "OgloboAppCondensed", size: 20.0)!
        let paragraphStyleSubtitle = NSMutableParagraphStyle()
        paragraphStyleSubtitle.lineHeightMultiple = 0.75
        paragraphStyleSubtitle.alignment = .left
        paragraphStyleSubtitle.lineBreakMode = .byWordWrapping
        
        lblSubtitle.attributedText = NSAttributedString(string: currentNews.description, attributes: [
            NSAttributedString.Key.paragraphStyle: paragraphStyleSubtitle,
            NSAttributedString.Key.font: fontSubtitle,
            NSAttributedString.Key.foregroundColor: Constants.Colors.BlueText])
        
        
        let fontText = UIFont(name: "Georgia", size: 18.0)!
        let paragraphStyleText = NSMutableParagraphStyle()
        paragraphStyleText.lineHeightMultiple = 1.3
        paragraphStyleText.alignment = .left
        paragraphStyleText.lineBreakMode = .byWordWrapping
        
        let texto = currentNews.content.replacingOccurrences(of: "\n", with: "")
        
        lblTexto.attributedText = NSAttributedString(string: texto, attributes: [
            NSAttributedString.Key.paragraphStyle: paragraphStyleText,
            NSAttributedString.Key.font: fontText,
            NSAttributedString.Key.foregroundColor: UIColor.black])
        
        
        if self.currentNews.hasImage{
            
            if let urlString = currentNews.imageURL, let url = URL(string: urlString){
                imgNews.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: [], completed: nil)
                imgNews.isHidden = false
            }
            else{
                self.imgNews.isHidden = true
                self.constraintLeadingTitle.constant = 0
            }
        }
        else{
            self.imgNews.isHidden = true
            self.constraintLeadingTitle.constant = 0
        }
    }
}
