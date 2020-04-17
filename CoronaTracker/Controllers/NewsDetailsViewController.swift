//
//  NewsDetailsViewController.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/13/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtContent: UITextView!
    
    var news = News()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: news.link)!
        downloadImage(from: url)
        lblTitle.text = news.title
        txtContent.text = news.content
        // Do any additional setup after loading the view.
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
    @IBAction func readMoreAction(_ sender: Any) {
        guard let url = URL(string: news.url) else { return }
        UIApplication.shared.open(url)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
