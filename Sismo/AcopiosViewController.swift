//
//  AcopiosViewController.swift
//  Sismo
//
//  Created by Alberto Huerdo on 9/21/17.
//  Copyright © 2017 huerdo. All rights reserved.
//

import UIKit

class AcopiosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.getAcopios { (response, error) in
            print(response)
            print(error as Any)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

