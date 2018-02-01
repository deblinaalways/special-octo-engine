//
//  PortfolioViewController.swift
//  Kuliza
//
//  Created by Deblina Das on 04/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    // MARK: Factory method
    class func viewcontroller() -> PortfolioViewController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PortfolioViewController") as! PortfolioViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    fileprivate func setPortfolioData(for row: Int) -> PortfolioData {
        switch row {
        case 0: return PortfolioData(header: "Top 5 Holdings", leftContent: "N.A.", rightContent: "HDFC Bank, ICICI Bank, Vedanta, Maruti Suzuki, Yes Bank")
        case 1: return PortfolioData(header: "Weightage to the Top 5 Holdings", leftContent: "88.88%", rightContent: "22.81%")
        case 2: return PortfolioData(header: "Top 3 Sectors", leftContent: "Financials, SOV, Metals and Mining", rightContent: "Financials, Miscellaneous, Power Utilities")
        default: return PortfolioData(header: "Weightage to the Top 3 Sectors", leftContent: "86.7%", rightContent: "79.9%")
        }
    }
}

extension PortfolioViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! PortfolioTableViewCell
        cell.configure(data: setPortfolioData(for: indexPath.row))
        return cell
    }
}


