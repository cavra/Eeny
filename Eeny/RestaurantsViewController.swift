//
//  RestaurantsViewController.swift
//  Eeny
//
//  Created by Cory Avra on 10/1/16.
//  Copyright © 2016 Cory and Eileen. All rights reserved.
//

import UIKit
import GooglePlaces

class RestaurantsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var restLabel: UILabel!
   
    // Variables
    var places: [NSDictionary]?
    var placesClient: GMSPlacesClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient.shared()

        // Get the data from the network
        loadDataFromNetwork()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDataFromNetwork() {
        
        placesClient?.currentPlace(callback: {
            (placeLikelihoodList: GMSPlaceLikelihoodList?, error: Error?) -> Void in
            if let error = error {
                    print("Pick Place error: \(error.localizedDescription)")
                return
        }

        self.restLabel.text = "No current place"

        if let placeLikelihoodList = placeLikelihoodList {
            let place = placeLikelihoodList.likelihoods.first?.place
                if place != nil {
                    self.restLabel.text = place?.name
                    //self.addressLabel.text = place.formattedAddress!.componentsSeparatedByString(", ").joinWithSeparator("\n")
                }
            }
        })
    }

}
