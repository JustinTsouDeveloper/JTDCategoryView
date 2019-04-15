//
//  CategoryCollectionView.swift
//  CategoryView
//
//  Created by Justin Tsou on 2019/4/12.
//  Copyright © 2019 iOSDeveloper. All rights reserved.
//

import UIKit

protocol CategoryCollectionViewDelegate: class {
    func didCollectionViewSelectItem(category:String)
}

class CategoryCollectionView: UICollectionView {
    
    private var categorys: Array<String>?
    private var imageNames: Array<String>?
    weak var delegates: CategoryCollectionViewDelegate?
    private var currentIndexPath:IndexPath?
    private let lightgray = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1)
    private let dimgray = UIColor(red: 105.0/255.0, green: 105.0/255.0, blue: 105.0/255.0, alpha: 1)
    private var currentCellBackgroundColor = UIColor.white
    private var noncurrentCellBackgroundColor = UIColor.white
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    convenience init(categorys:Array<String>,imageNames: Array<String>,frame: CGRect,layout: UICollectionViewLayout) {
        self.init(frame: frame, collectionViewLayout:layout)
        self.categorys = categorys
        self.imageNames = imageNames
        self.currentIndexPath = IndexPath.init(row: 0, section: 0)
        self.setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        self.dataSource = self
        self.delegate = self
        self.isPagingEnabled = true
        self.backgroundColor = .clear
        let bundle = Bundle(for: type(of: self))
        self.register(UINib(nibName: "CategoryCell", bundle: bundle), forCellWithReuseIdentifier: "CategoryCell")
    }
    
    func setCurrentCellBackgroundColor(color:UIColor) {
        self.currentCellBackgroundColor = color
    }
    
    func setNonCurrentCellBackgroundColor(color:UIColor) {
        self.noncurrentCellBackgroundColor = color
    }
    
}

extension CategoryCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categorys?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        let category = self.categorys![indexPath.row]
        categoryCell.categoryLabel.text = category
        let imageName = self.imageNames![indexPath.row]
        categoryCell.setCategoryImage(imageName: imageName)
        
        if self.currentIndexPath?.row == indexPath.row {
            categoryCell.categoryLabel.textColor = self.dimgray
            categoryCell.lineLabel.backgroundColor = self.dimgray
            categoryCell.backgroundColor = self.currentCellBackgroundColor
            
            categoryCell.lineLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                categoryCell.lineLabel.transform = .identity
            }, completion: nil)
        }else {
            categoryCell.categoryLabel.textColor = self.lightgray
            categoryCell.lineLabel.backgroundColor = UIColor.white
            categoryCell.backgroundColor = self.noncurrentCellBackgroundColor
        }
        
        return categoryCell
    }
}

extension CategoryCollectionView:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.currentIndexPath != indexPath {
            self.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            self.reloadData()
            self.delegates?.didCollectionViewSelectItem(category: self.categorys![indexPath.row])
        }
        
        self.currentIndexPath = indexPath
    }
    
}
