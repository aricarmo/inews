//
//  NewsViewController.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit
import SimpleImageViewer

final class NewsViewController: BaseViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    var news: News!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupInterface() {
        super.setupInterface()
        currentTitle = news.source.name.uppercased()
        tableView.registerCells(forFieldTypes: [.newsTitle, .newsImage, .newsText])
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.estimatedRowHeight = 188.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func cellType(for indexPath: IndexPath) -> UITableView.CellType{
        
        switch indexPath.row {
        case 0: return .newsTitle
        case 1: return news.hasImage ? .newsImage : .newsText
        case 2: return .newsText
        default: return .newsText
        }
    }

}

//MARK: - TableView DataSource/Delegate

extension NewsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if news.hasImage{
            return news.hasText ? 3 : 2
        }
        return news.hasText ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = cellType(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: type.rawValue, for: indexPath) as! NewsTableViewCell
        cell.setup(with: news, and: type) { [unowned self](imgToPreview) in
            let configuration = ImageViewerConfiguration { config in
                config.imageView = imgToPreview
            }
            self.present(ImageViewerController(configuration: configuration), animated: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if news.hasImage && indexPath.row == 1{
            if (UIScreen.main.bounds.size.width < 321.0) {
                return 207
            }
            else if (UIScreen.main.bounds.size.width < 376.0) {
                return 240
            }
            else if (UIScreen.main.bounds.size.width < 415.0) {
                return 264
            }
            else if UIScreen.main.bounds.size.width < 769.0{
                return 462
            }
            else if UIScreen.main.bounds.size.width < 1025.0{
                return 617
            }
        }
        return UITableView.automaticDimension
    }
}
