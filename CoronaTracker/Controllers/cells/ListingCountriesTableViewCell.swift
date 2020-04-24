//
//  ListingCountriesTableViewCell.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/11/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit
import SJFrameSwift

class ListingCountriesTableViewCell: UICollectionViewCell {

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

   

    func setData(country: Country){
        lblName.text = "\(country.country ?? "")"
        lblConfirmed.text = "Confirmed: \(country.confirmed ?? "")"

    }
    

}
