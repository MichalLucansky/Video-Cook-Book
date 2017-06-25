//
//  RecepieCell.swift
//  VideoCookBook
//
//  Created by Michal Lučanský on 23.6.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var recipe: Recipe!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        
    }
    
    func configCell(_ recipe: Recipe){
        self.recipe = recipe
        name.text = recipe.title
        thumb.image = UIImage(named: recipe.imageThumb)
    
    }
    
}
