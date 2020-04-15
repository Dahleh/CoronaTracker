//
//  NewsViewController.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/13/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var selectedIndex = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
                gettingNews.instance.getAllNumbers{(success) in
                    if success{
                        print("Loaded")
                        self.tableView.reloadData()
                    }else{
                        print("not loaded")
                    }
                }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetails"){
                let displayVC = segue.destination as! NewsDetailsViewController
            displayVC.news = gettingNews.instance.newsArr[selectedIndex]
        }
    }

    

}


extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gettingNews.instance.newsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell.news.item", for: indexPath) as? NewsTableViewCell{
            cell.setData(news: gettingNews.instance.newsArr[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let url = URL(string: gettingNews.instance.newsArr[indexPath.row].link) else { return }
//        UIApplication.shared.open(url)
        self.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "toDetails", sender: self)
        
    }
    
    
    
}
