//
//  ViewController.swift
//  Sample
//
//  Created by Andrej Kolar on 22/01/2019.
//  Copyright © 2019 Andrej Kolar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var baseUrlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let info = Bundle.main.infoDictionary, let baseUrl = info["BaseUrl"] as? String {
            baseUrlLabel.text = baseUrl
        }
        
    }


}

