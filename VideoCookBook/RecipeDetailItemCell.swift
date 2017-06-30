//
//  RecipeDetailItemCell.swift
//  VideoCookBook
//
//  Created by Michal Lučanský on 28.6.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailItemCell: UICollectionViewCell {
    
    
    @IBOutlet weak var typeImage: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    fileprivate var type : String = ""
    
    var itemCell : RecipeTypeItem!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        
    }
    
    
    func configTypeCell(itemCell : RecipeTypeItem){
        self.itemCell = itemCell
        typeImage.image = UIImage(named: itemCell.image)
        self.type = itemCell.recipeType
        labelName.text = itemCell.recipeType
    }
    
    
    
    
    
}
