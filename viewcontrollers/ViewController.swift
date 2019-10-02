//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gabriella Messias Aleo on 24/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate{
    
 
    @IBOutlet var tableView : UITableView?
    @IBOutlet var nameField: UITextField?
    @IBOutlet var happinessField: UITextField?
    var delegate : ViewControllerDelegate?
    var selected = Array<Item>()
    
    var comidas = Array<Item>()
    
    override func viewDidLoad() {
        let itemBar = UIBarButtonItem(title: "new item", style: UIBarButtonItem.Style.plain, target:self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = itemBar
        
        self.comidas = Dao().loadItems()
    }
    
    @objc func showNewItem(){
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
        }
    }
    func addItem(_ item: Item) {
        comidas.append(item)
        Dao().saveItems(comidas)

        if let table = tableView{
        table.reloadData()
        }else{
            Alert(controller: self).show("Erro", "nao deu")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return comidas.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let celulaReuso = "celulaReuso"
          let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
          celula.textLabel?.text = comidas[indexPath.row].name
          
          return celula
      }
    
    func convertToInt(_ text:String?) -> Int?{
        if let number = text{
            return Int(number)
        }
        return nil
    }
    
    func getMeal() -> Meal? {
        
        if let name = nameField?.text{
            if let happiness = convertToInt(happinessField?.text){
                    let meal = Meal(name: name, happiness: happiness, items: selected)
                    meal.items = selected
                    print(" \(meal.name) e \(meal.happiness) com \(meal.items)" )
                    return meal
            }
        }
        return nil
    }
     
    //add view controller
       @IBAction func add(){
        
        if let meal = getMeal(){
                if let meals = delegate{
                    meals.add(meal)
                if let navigation = navigationController{
                    navigation.popViewController(animated: true)
                }else{
                    Alert(controller: self).show("Erro", "Algo deu errado")
                }
                 return
            }
        }
            Alert(controller: self).show("Erro", "Algo deu errado")
        }
        
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if let cell = tableView.cellForRow(at: indexPath){
               
               if(cell.accessoryType == UITableViewCell.AccessoryType.none){
                
               cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = comidas[indexPath.row]
                selected.append(item)
                
               }else{
                  cell.accessoryType = UITableViewCell.AccessoryType.none
                    let item = comidas[indexPath.row]
                if let position = selected.firstIndex(of: item){
                    selected.remove(at: position)
                }else{
                    Alert(controller: self).show("Erro", "algo deu errado")
                }
               }
           }else{
            Alert(controller: self).show("Erro", "algo deu errado")
        }

       
}
}

