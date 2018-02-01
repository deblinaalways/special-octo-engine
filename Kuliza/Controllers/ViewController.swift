//
//  ViewController.swift
//  Kuliza
//
//  Created by Deblina Das on 04/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var type: ControllerType!
    
    // MARK: Factory Method
    class func viewController(with type: ControllerType) -> ViewController {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        controller.type = type
        return controller
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        switch type {
        case .scheme:
            label.text = "Scheme View Controller"
            self.view.backgroundColor = UIColor.cyan
        case .performance:
            label.text = "Performance View Controller"
            self.view.backgroundColor = UIColor.darkGray
        case .management:
            label.text = "Management View Controller"
            self.view.backgroundColor = UIColor.yellow
        default: break
        }
    }

}

enum ControllerType {
    case scheme
    case performance
    case portfolio
    case management
}

