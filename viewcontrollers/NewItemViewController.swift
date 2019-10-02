//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Gabriella Messias Aleo on 01/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
   
    var delegate: AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate){
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var calories: UITextField!
    
    @IBAction func addNewItem(_ sender: Any) {
        
        let nome = name!.text
        let calorias = Double(calories!.text!)
        
        if(nome == nil || calorias == nil || delegate == nil)
        {
            return
        }
        
        let item = Item(name: nome!, calories: calorias!)
        delegate!.addItem(item)
        
        print("add new item")
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
        }
    }
    
    
}
