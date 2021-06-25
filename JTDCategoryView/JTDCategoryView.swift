//
//  CategoryView.swift
//  TestCustomView
//
//  Created by Justin Tsou on 2019/3/12.
//  Copyright © 2019 iOSDeveloper. All rights reserved.
//

import UIKit

public protocol JTDCategoryViewDelegate: class {
    func didCollectionViewSelectItem(category:String)
}

public class JTDCategoryView: UIView {
    
    @IBOutlet private var contentView: UIView!
    private var categorys: Array<String>?
    //private var imageNames: Array<String>?
    private var collectionView:CategoryCollectionView?
    private var collectionViewLayout:UICollectionViewFlowLayout?
    public weak var delegate: JTDCategoryViewDelegate?
    private let categoryAmount = 4
    
    // MARK - View life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //public convenience init(categorys:Array<String>,imageNames: Array<String>,frame:CGRect) {
    public convenience init(categorys:Array<String>,frame:CGRect) {
        self.init(frame: frame)
        self.categorys = categorys
        //self.imageNames = imageNames
        self.setupCollectionView(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(frame:CGRect) {
        
        // 動態寫法
//        let path = Bundle(for: type(of: self)).resourcePath!
//        let resource_bundle = Bundle(path: path)
//        let nib = UINib(nibName: "JTDCategoryView", bundle: resource_bundle)
        
        
        // 靜態寫法        
        let path = Bundle(for: type(of: self)).path(forResource: "JTDCategoryView", ofType: "framework") ?? ""
        let path1 = Bundle(for: type(of: self)).path(forResource: "Pods/IncludeJTDCategoryViewSDK/IncludeJTDCategoryViewSDK/JTDCategoryView", ofType: "framework") ?? ""
        let path2 = Bundle(for: type(of: self)).path(forResource: "Pods/IncludeJTDCategoryViewSDK/Frameworks/JTDCategoryView", ofType: "framework") ?? ""
        
        print("Bundle:\(Bundle(for: type(of: self)))")
        print("path1:\(path1)")
        print("path2:\(path2)")
        
        let resource_bundle = Bundle(path: path)
        
        print("resource_bundle:\(resource_bundle)")
        
        let nib = UINib(nibName: "JTDCategoryView", bundle: resource_bundle)
        
        contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        contentView.frame = bounds
        
        self.collectionViewLayout = self.setupCollectionViewFlowLayout()
        let viewFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
//        self.collectionView = CategoryCollectionView(categorys: self.categorys!, imageNames: self.imageNames! , frame: viewFrame, layout: self.collectionViewLayout!  )
        self.collectionView = CategoryCollectionView(categorys: self.categorys!, frame: viewFrame, layout: self.collectionViewLayout!  )
        self.collectionView?.showsHorizontalScrollIndicator = false
        
        collectionView?.delegates = self
        contentView.addSubview(self.collectionView!)
        addSubview(contentView)
    }
    
    private func setupCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = CGFloat.leastNonzeroMagnitude
        collectionViewLayout.minimumInteritemSpacing = CGFloat.leastNonzeroMagnitude
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.itemSize = self.categorys!.count < categoryAmount ? CGSize(width: self.frame.size.width / CGFloat(self.categorys!.count) , height: self.frame.size.height) : CGSize(width: self.frame.size.width / CGFloat(categoryAmount) , height: self.frame.size.height)
        return collectionViewLayout
    }
    
    public func setCurrentCellBackgroundColor(color:UIColor) {
        self.collectionView?.setCurrentCellBackgroundColor(color: color)
    }
    
    public func setNonCurrentCellBackgroundColor(color:UIColor) {
        self.collectionView?.setNonCurrentCellBackgroundColor(color: color)
    }
}

extension JTDCategoryView: CategoryCollectionViewDelegate {
    func didCollectionViewSelectItem(category: String) {
        self.delegate?.didCollectionViewSelectItem(category: category)
    }
}
