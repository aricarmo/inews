//
//  AppDelegate.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func setupInterface(){
        
        let font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)!
        let textTitleOptions: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
        UINavigationBar.appearance().titleTextAttributes = textTitleOptions
        UINavigationBar.appearance().barTintColor = Constants.Colors.NavigationBar
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barStyle = .black
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Interface
        setupInterface()
        
        
        return true
    }


}

