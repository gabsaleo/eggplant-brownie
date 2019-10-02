//
//  MealTableViewController.swift
//  eggplant-brownie
//
//  Created by Gabriella Messias Aleo on 26/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit
class MealTableViewController : UITableViewController, ViewControllerDelegate{
    
    var meals = Array<Meal>()
    
    func add(_ meal : Meal){
        meals.append(meal)
        print("adding \(meal.name)")
        Dao().saveMeals(meals)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        self.meals = Dao().loadMeals()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
        let view = segue.destination as! ViewController
        view.delegate = self
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = meals[indexPath.row].name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer){
        if(recognizer.state == UIGestureRecognizer.State.began){
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row
                let meal = meals[row]
                
                RemoveMealController(controller: self).show(meal, handler: { action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
            }
        
        }
        
    }
    
}
