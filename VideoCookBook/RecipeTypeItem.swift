//
//  RecipeTypeItem.swift
//  VideoCookBook
//
//  Created by Michal Lučanský on 28.6.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import Foundation

class RecipeTypeItem{

    fileprivate var _image : String
    fileprivate var _recipeType : String
    
    
    init(image: String, recipeType: String) {
        self._image = image
        self._recipeType = recipeType
    }

    var image : String{
        return _image
    }
    var recipeType : String{
        return _recipeType
    }
}
