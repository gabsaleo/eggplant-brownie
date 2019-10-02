//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Gabriella Messias Aleo on 02/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
import UIKit
class RemoveMealController{
    
    let controller:UIViewController
    
    init(controller:UIViewController){
        self.controller = controller
    }
    
    

    func show(_ meal:Meal, handler:@escaping (UIAlertAction) -> Void){
        let alertDetails = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
        
         
         let acao = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
         
         alertDetails.addAction(acao)
         
         let remove  = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: handler)
         alertDetails.addAction(remove)
         
         print("longo: \(meal.name)")
        controller.present(alertDetails, animated: true, completion: nil)
    }
}
