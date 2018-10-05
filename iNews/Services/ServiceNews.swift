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
    
    /**
     Obtém a lista de notícias da Home
     - Parameter completion: O callback de retorno.
     - Parameter news: Um array de objetos New retornada pela API.
     - Parameter error: Erro retornado pela API (caso ocorra).
     */
    static func getNewsForCover(_ completion: @escaping (_ news: [News], _ error: Error?) -> Void){
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
