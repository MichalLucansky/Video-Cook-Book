//
//  RecipeDetailVC.swift
//  VideoCookBook
//
//  Created by Michal Lučanský on 25.6.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {
    
    var recipeDetail : Recipe!

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var ingrediencyLabel: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getVideo(code: recipeDetail.url)

        titleLable.text = recipeDetail.title
        ingrediencyLabel.text = recipeDetail.ingrediency
        descriptionLable.text = recipeDetail.description
    }
    
    private func getVideo(code: String){
    let url = URL(string: "https://www.youtube.com/embed/\(code)")
    
        webView.loadRequest(URLRequest(url : url!))
    
    
    }

    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
 
}
