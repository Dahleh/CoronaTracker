//
//  ListingCountriesTableViewCell.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/11/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit

class ListingCountriesTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblConfirmed: UILabel!
    @IBOutlet weak var lblRecovered: UILabel!
    @IBOutlet weak var lblDeaths: UILabel!
    @IBOutlet weak var lblToday: UILabel!
    @IBOutlet weak var lblActive: UILabel!
    @IBOutlet weak var lblCritical: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(country: Country){
        lblName.text = "Country Name: \(country.country ?? "")"
        lblConfirmed.text = "Confirmed Cases: \(country.confirmed ?? "")"
        lblRecovered.text = "Recovered Cases: \(country.recovered ?? "")"
        lblDeaths.text = "Death Cases: \(country.deaths ?? "")"
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
}
