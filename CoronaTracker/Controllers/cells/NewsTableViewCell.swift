//
//  NewsTableViewCell.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/13/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var imgNews: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setData(news: News){
        lblTitle.text = "Title: \(news.title ?? "")"
        let url = URL(string: news.link)!
        downloadImage(from: url)
        
    
       }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
         URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
     }
     
     func downloadImage(from url: URL) {
         print("Download Started")
         getData(from: url) { data, response, error in
             guard let data = data, error == nil else { return }
             print(response?.suggestedFilename ?? url.lastPathComponent)
             print("Download Finished")
             DispatchQueue.main.async() {
                 self.imgNews.image = UIImage(data: data)
             }
         }
     }
}
