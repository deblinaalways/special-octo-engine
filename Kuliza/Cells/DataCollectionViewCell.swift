//
//  DataCollectionViewCell.swift
//  Kuliza
//
//  Created by Deblina Das on 04/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bottomView: UIView!
    
    func configure(with row: Int, isSelected: Bool? = false) {
        titleLabel.font = isSelected! ? UIFont(name: "Helvetica Bold", size: 12) : UIFont(name: "Helvetica", size: 12)
        titleLabel.text = setTitleLabel(with: row)
        bottomView.isHidden = isSelected! ? false : true
    }
    
    private func setTitleLabel(with row: Int) -> String {
        switch row {
        case 0:  return "Scheme"
        case 1:  return "Performance"
        case 3:  return "Management"
        default: return "Portfolio"
        }
    }
}
