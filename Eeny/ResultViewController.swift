//
//  resultViewController.swift
//  Eeny
//
//  Created by Cory Avra on 10/1/16.
//  Copyright © 2016 Cory and Eileen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    var results: String = ""
    var color: UIColor = UIColor.gray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        result.text = results
        result.backgroundColor = color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
