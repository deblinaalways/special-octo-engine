//
//  DataCollectionViewDataSource.swift
//  Kuliza
//
//  Created by Deblina Das on 05/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import Foundation
import UIKit

class DataCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var _delegate: DataDelegate!
    var selectedRow = 2
    
    // Initialization
    init(collectionView: UICollectionView, delegate: DataDelegate) {
        self.collectionView = collectionView
        self._delegate = delegate
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! DataCollectionViewCell
        cell.configure(with: indexPath.row, isSelected: indexPath.row == selectedRow ? true : false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! DataCollectionViewCell
        cell.configure(with: indexPath.row, isSelected: true)
        self.collectionView.reloadData()
        self._delegate.setupTabViewController(for: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width / 4, height: self.collectionView.bounds.height * 0.95)
    }
}
