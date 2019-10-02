//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Gabriella Messias Aleo on 02/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
class Dao{
    
    let mealsArchive:String, itemsArchive:String
    
    init(){
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        mealsArchive = "\(dir)/eggplant-brownie-meals.dados"
        itemsArchive = "\(dir)/eggplant-brownie-items.dados"
        
    }
    
    func saveMeals(_ meals:Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func loadMeals() -> Array<Meal>{
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile:mealsArchive){
                   return loaded as! Array<Meal>
            }
        return []
    }
       
    
    
    func saveItems(_ items:Array<Item>){
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    func loadItems() -> Array<Item>{
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile:itemsArchive){
            return loaded as! Array<Item>
        }
        return []
    }
    
    
}
