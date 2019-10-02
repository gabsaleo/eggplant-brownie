//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Gabriella Messias Aleo on 25/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
class Meal : NSObject , NSCoding{
   
    var name:String
    var happiness:Int
    var items:Array<Item>
    
    init(name:String, happiness:Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func allCalories() -> Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        return total
    }
    
    func details() -> String{
        var message = "Happiness \(happiness)"
        for item in items{
        message += "\n \(item.name) - calories: \(item.calories)"
        }
        return message
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        happiness = coder.decodeInteger(forKey: "happiness")
        items = coder.decodeObject(forKey: "items") as! Array
       }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(happiness, forKey: "happiness")
        coder.encode(items, forKey: "items")
    }
    
}
