//
//  Item.swift
//  eggplant-brownie
//
//  Created by Gabriella Messias Aleo on 25/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
class Item : NSObject, NSCoding{

    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(calories, forKey: "calories")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        calories = coder.decodeDouble(forKey: "calories")
    }
    
    static func ==(first:Item, second:Item) -> Bool{
         return first.name == second.name && first.calories == second.calories
     }
     
}
