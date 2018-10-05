//
//  ServiceNews.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class ServiceNews{
    
    static func getNewsForCover(_ completion: @escaping ([News], Error?) -> Void){
        guard let url = URL(string: Constants.URLs.APITeste) else{ return }
        
        var resultNews = [News]()
        DispatchQueue.main.async {
            Alamofire.request(url, method: .get).validate().responseJSON { response in
                //print("###Success: \(response.result.isSuccess)")
                
                switch response.result{
                case .success(let value):
                    
                    let json = JSON(value)
                    let articles = json["articles"].arrayValue
                    
                    for article in articles{
                        guard let article = News(with: article) else { continue }
                        resultNews.append(article)
                    }
                    
                    DispatchQueue.main.async {
                        completion(resultNews, nil)
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(resultNews, error)
                    }
                }
            }
        }
    }
}
