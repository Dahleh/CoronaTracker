//
//  gettingNumbers.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 3/23/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class gettingNews {
    static let instance = gettingNews()
    
    var newsArr = [News]()
    func getAllNumbers(completion: @escaping CompletionHandler){
        
        AF.request("https://newsapi.org/v2/everything?q=covid&apiKey=e7b469b633194032bca123741c4751ac", method: .get, encoding: JSONEncoding.default).responseJSON { (respones) in
            switch respones.result{
            case .success(let value):
                let json = JSON(value)
                
                for item in json["articles"].arrayValue{
                    let title = item["title"].stringValue
                    let link = item["urlToImage"].stringValue
                    let content = item["content"].stringValue
                    let url = item["url"].stringValue
                    let news = News(title: title, link: link, content: content, url: url)
                    print("HGHGHGHHGHGHGHGHHG\(news)")
                    self.newsArr.append(news)
                }
                
                print("JDJDJDJ\(self.newsArr)")
                completion(true)
                
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
        
    }
    
}


