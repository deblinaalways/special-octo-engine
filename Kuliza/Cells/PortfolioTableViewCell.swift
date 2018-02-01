//
//  PortfolioTableViewCell.swift
//  Kuliza
//
//  Created by Deblina Das on 04/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import UIKit

class PortfolioTableViewCell: UITableViewCell {

    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var rightContentLabel: UILabel!
    @IBOutlet var leftContentLabel: UILabel!
    
    func configure(data: PortfolioData) {
        headerLabel.text = data.header
        rightContentLabel.text = data.rightContent
        leftContentLabel.text = data.leftContent
    }

}

struct PortfolioData {
    var header: String!
    var leftContent: String!
    var rightContent: String!
}
