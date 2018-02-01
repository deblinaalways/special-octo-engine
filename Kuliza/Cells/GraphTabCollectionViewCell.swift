//
//  GraphTabCollectionViewCell.swift
//  Kuliza
//
//  Created by Deblina Das on 04/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import UIKit

class GraphTabCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bottomView: UIView! // the orange underline
    
    
    func configure(with row: Int, isSelected: Bool? = false) {
        titleLabel.font = isSelected! ? UIFont(name: "Helvetica Bold", size: 12) : UIFont(name: "Helvetica", size: 12)
        titleLabel.text = setTitleLabel(with: row)
        bottomView.isHidden = isSelected! ? false : true
    }
    
    private func setTitleLabel(with row: Int) -> String {
        switch row {
        case 0:  return "3 Months"
        case 1:  return "6 Months"
        case 3:  return "3 Year"
        case 4:  return "5 Year"
        default: return "1 year"
        }
    }
}
