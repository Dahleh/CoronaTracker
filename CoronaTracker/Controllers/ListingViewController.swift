//
//  ListingViewController.swift
//  CoronaTracker
//
//  Created by Faris Dahleh on 4/11/20.
//  Copyright © 2020 Faris Dahleh. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchField: UISearchBar!
    var searchdata = [Country]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self
        searchdata = gettingNumbers.instance.countries
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toPopUp" {
               let rVC = segue.destination as! PopUpViewController
            rVC.country = sender as? Country ?? Country()
           }
       }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return searchdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell.item", for: indexPath) as? ListingCountriesTableViewCell{
            cell.setData(country: searchdata[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPopUp", sender: searchdata[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""

        searchdata = gettingNumbers.instance.countries

        searchBar.endEditing(true)

        collectionView.reloadData()
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
        
        
        
        collectionView.reloadData()
    }
    
}
