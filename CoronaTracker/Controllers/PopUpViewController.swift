//
//  PopUpViewController.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/23/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var country = Country()

    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblConfirmed: UILabel!
    @IBOutlet weak var lblRecovered: UILabel!
    @IBOutlet weak var lblDeath: UILabel!
    @IBOutlet weak var lblToday: UILabel!
    @IBOutlet weak var lblActive: UILabel!
    @IBOutlet weak var lblCritical: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clostBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setData(){
        lblName.text = "\(country.country ?? "")"
        lblConfirmed.text = "Confirmed Cases: \(country.confirmed ?? "")"
        lblRecovered.text = "Recovered Cases: \(country.recovered ?? "")"
        lblDeath.text = "Death Cases: \(country.deaths ?? "")"
        lblToday.text = "Today Cases: \(country.todayCases ?? "")"
        lblActive.text = "Active Cases: \(country.active ?? "")"
        lblCritical.text = "Critical Cases: \(country.critical ?? "")"
        let url = URL(string: country.flag)!
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
                self.imgFlag.image = UIImage(data: data)
            }
        }
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
