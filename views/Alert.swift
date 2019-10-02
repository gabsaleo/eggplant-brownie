//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Gabriella Messias Aleo on 02/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    
    let controller:UIViewController
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(_ title:String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(cancel)
        
        let remove  = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: nil)
        alert.addAction(remove)
        
        
        controller.present(alert, animated: true, completion: nil)
    }
}
