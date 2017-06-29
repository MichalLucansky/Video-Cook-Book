//
//  ViewController.swift
//  VideoCookBook
//
//  Created by Michal Lučanský on 23.6.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var recipeArray = [Recipe]()
    private var filteredRecipe = [Recipe]()
    private var insearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       collectionView.delegate = self
       collectionView.dataSource = self
       searchBar.delegate = self
       searchBar.returnKeyType = UIReturnKeyType.done
       
    }

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recepieCell", for: indexPath) as? RecipeCell{
            let recipe : Recipe
            if insearchMode{
                recipe = filteredRecipe[indexPath.row]
                cell.configCell(recipe)
            }else{
                recipe = recipeArray[indexPath.row]
                cell.configCell(recipe)
            }
            
        return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let recipe : Recipe
        
        if insearchMode{
            recipe = filteredRecipe[indexPath.row]
        }else{
            recipe = recipeArray[indexPath.row]
        }
        performSegue(withIdentifier: "recipeDetailVC", sender: recipe)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if insearchMode{
            return filteredRecipe.count
        }else{
            return recipeArray.count
        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            insearchMode = false
            view.endEditing(true)
            collectionView.reloadData()
        }else{
            insearchMode = true
            let lower = searchBar.text?.lowercased()
            filteredRecipe = recipeArray.filter({$0.title.range(of: lower!) != nil})
            collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetailVC"{
             let detailVC = segue.destination as! RecipeDetailVC
             let recipe = sender as! Recipe
             detailVC.recipeDetail = recipe
            
        }
    }
    
}

