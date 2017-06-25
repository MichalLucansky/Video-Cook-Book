//
//  Recipe.swift
//  VideoCookBook
//
//  Created by Michal Lučanský on 23.6.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import Foundation

class Recipe{
    
    fileprivate var _title : String
    fileprivate var _ingrediency : String
    fileprivate var _url : String
    fileprivate var _description : String
    fileprivate var _imageThumb : String
    
    var title : String{
        return _title
    }
    var ingrediency : String{
        return _ingrediency
    }
    var url : String{
        return _url
    }
    var description : String{
        return _description
    }
    var imageThumb : String{
        return _imageThumb
    }
    
    
    init(title :String, ingrediency :String, url :String, description: String, imageThumb: String ) {
        self._title = title
        self._ingrediency = ingrediency
        self._url = url
        self._description = description
        self._imageThumb = imageThumb 
       
       
    }
    
    
    
}
