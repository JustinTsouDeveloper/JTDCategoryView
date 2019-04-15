//
//  CategoryCell.swift
//  TestCustomView
//
//  Created by Justin Tsou on 2019/3/12.
//  Copyright © 2019 iOSDeveloper. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var lineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lineLabel.layer.masksToBounds = true
        self.lineLabel.layer.cornerRadius = self.lineLabel.bounds.height / 2
    }

    func setCategoryImage(imageName:String) {
            self.categoryImageView.image = UIImage(named:imageName)
    }
}
