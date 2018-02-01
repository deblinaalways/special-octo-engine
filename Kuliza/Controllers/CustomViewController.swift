//
//  CustomViewController.swift
//  Kuliza
//
//  Created by Deblina Das on 05/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    // Factory Method
    class func navigate() -> UINavigationController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Compare"
    }

    @IBAction func navigateMe(_ sender: UIButton) {
        self.navigationController?.pushViewController(CompareTableViewController.viewcontroller(), animated: true)
    }
}
