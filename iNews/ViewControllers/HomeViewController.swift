//
//  HomeViewController.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    private var news = [News]()
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNews()
    }
    
    override func setupInterface() {
        super.setupInterface()
        tableView.register(UINib(nibName: "NewsListTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsListTableViewCell")
        tableView.register(UINib(nibName: "FeaturedNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "FeaturedNewsTableViewCell")
        tableView.tableFooterView = UIView(frame: .zero)
        refreshControl.addTarget(self, action: #selector(self.getNews), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func getNews(){
        refreshControl.beginRefreshing()
        ServiceNews.getNewsForCover { [unowned self](data, error) in
            self.refreshControl.endRefreshing()
            if let error = error{
                print("Erro ao obter dados: \(error.localizedDescription)")
            }
            else{
                self.news = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}


//MARK: - TableView DataSource/Delegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = indexPath.row == 0 ? "FeaturedNewsTableViewCell" : "NewsListTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NewsListTableViewCell else { return UITableViewCell()}
        cell.setup(with: news[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            if news[indexPath.row].hasImage{
                if UIScreen.main.bounds.size.width < 321.0{
                    return 193.0
                }
                else if UIScreen.main.bounds.size.width < 376{
                    return 226.0
                }
                else if UIScreen.main.bounds.size.width < 415.0{
                    return 250
                }
                else if UIScreen.main.bounds.size.width < 769.0{
                    return 462
                }
                else if UIScreen.main.bounds.size.width < 1025.0{
                    return 617
                }
            }
        }
        else{
            return 81.0
        }
        
        return 81.0
    }
}
