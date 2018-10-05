//
//  BaseViewController.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit
import Reachability

class BaseViewController: UIViewController {
    
    var currentTitle: String?
    let reachability = Reachability()!
    
    //MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = " "
        self.setTitleView(nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTitleView(currentTitle)
    }
    
    //MARK: - Interface
    
    func setupInterface(){
        
    }
    
    private func setTitleView(_ text: String?){
        
        if text == nil{
            navigationItem.titleView = nil
            return
        }
        
        let lblTitle = UILabel()
        lblTitle.text = text
        lblTitle.textColor = UIColor.white
        lblTitle.font = UIFont.init(name: "HelveticaNeue-Bold", size: 20.0)!
        lblTitle.sizeToFit()
        navigationItem.titleView = lblTitle
    }
}
