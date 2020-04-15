//
//  ListingViewController.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/11/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UISearchBar!
    var searchdata = [Country]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchField.delegate = self
        searchdata = gettingNumbers.instance.countries
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("dsfadsfasdf\(gettingNumbers.instance.countries.count)")
        return searchdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell.listing.item", for: indexPath) as? ListingCountriesTableViewCell{
            print("OIOIOIOIOI\(gettingNumbers.instance.countries[indexPath.row])")
            cell.setData(country: searchdata[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""

        searchdata = gettingNumbers.instance.countries

        searchBar.endEditing(true)

        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
        
    {
        searchdata = searchText.isEmpty ? gettingNumbers.instance.countries : gettingNumbers.instance.countries.filter
            {
                (item: Country) -> Bool in
                
                // If dataItem matches the searchText, return true to include it
                
                return item.country.range(of: searchText, options: .caseInsensitive, range: nil,
                                          
                                          locale: nil) != nil
        }
        
        
        
        tableView.reloadData()
    }
    
}
