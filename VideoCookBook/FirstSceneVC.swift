//
//  FirstSceneVC.swift
//  VideoCookBook
//
//  Created by Michal Lučanský on 26.6.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import UIKit

class FirstSceneVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!

    private var recipeRawArray = [Recipe]()
    private var recipeType = ["Ryby","Hovädzina","Bravčovina","Jedlá bez mäsa","Kuracina","Dezerty","Šaláty","Všetky recepty","Polievky"]
    private var recipeTypeImage = ["1","2","3","4","5","6","7","8","9"]
    private var itemArray = [RecipeTypeItem]()
    private var filteredRecipeArray = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        parseDataCsv()
        createItemArray()
        
        
    }
    
    private func createItemArray(){
        
        for i in 0...recipeType.count - 1{
        itemArray.append(RecipeTypeItem(image: recipeTypeImage[i], recipeType: recipeType[i]))
        
        }
        
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuItemCell", for: indexPath) as? RecipeDetailItemCell
        let item : RecipeTypeItem
        item = itemArray[indexPath.row]
        cell?.configTypeCell(itemCell: item)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filterRecipies(recipeType: itemArray[indexPath.row])
        performSegue(withIdentifier: "firstVc", sender: Any?.self)
    
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstVc"{
             let vc = segue.destination as! ViewController
             vc.recipeArray = filteredRecipeArray
            
        
        }
    }
    private func filterRecipies(recipeType: RecipeTypeItem){
        filteredRecipeArray.removeAll()
        
        if recipeType.recipeType == "Všetky recepty"{
        filteredRecipeArray = recipeRawArray
        }else{
            for rType in recipeRawArray{
                if rType.recipeType == recipeType.recipeType{
                    filteredRecipeArray.append(rType)
                
                }
        
            }
        }
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 87, height: 87)
    }
    
    private func parseDataCsv(){
        let path = Bundle.main.path(forResource: "Datat", ofType: "csv")
        
        do {
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            
            for row in rows{
                let title = row["Name"]!
                let ingrediency = row["Ingrediency"]!
                let url = row["Url"]!
                let imageThumb = row["ImageThumb"]!
                let description = row["Description"]!
                let recipeType = row["RecipeType"]!
                let recipe = Recipe(title: title, ingrediency: ingrediency, url: url, description: description, imageThumb: imageThumb, recipeType: recipeType)
                recipeRawArray.append(recipe)
                
                
            }
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }


}
