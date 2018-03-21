//
//  ViewController.swift
//  ModuleSwift
//
//  Created by CSSCORP on 3/21/18.
//  Copyright © 2018 CSSCORP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let greenApple = Apple(name:"Green Apple", weight: 1.55, pricePerKg: 100)
        let normalApple = Apple(name: "Apple", weight: 2.00, pricePerKg: 75)
        let qualityOrange = Orange(name: "Quality Orange", weight: 3.00, pricePerKg: 50)
        let normalOrange = Orange(name: "Orange", weight: 2.10, pricePerKg: 35)
        
        let ram = Customer(name: "Ram", groceries: [greenApple,normalApple,qualityOrange,normalOrange])
        
        let saravanaStores = Groceries()
        saravanaStores.getCustomerShoppingListPrice(customer: ram)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



protocol GroceryItem {
    func totalCost() -> Float
    func itemDescription()
}


struct Orange: GroceryItem {
    let name: String
    let weight: Float
    let pricePerKg: Float
    
    func totalCost() -> Float {
        return weight * pricePerKg
    }
    
    func itemDescription() {
        print("Item Name: \(name) Weight: \(weight) Price: \(weight * pricePerKg)")
    }
    
    
}


struct Apple: GroceryItem {
    let name: String
    let weight: Float
    let pricePerKg: Float
    
    func totalCost() -> Float {
    return weight * pricePerKg
    }
    
    func itemDescription() {
        print("Item Name: \(name) Weight: \(weight) Price: \(weight * pricePerKg)")
    }
}


struct Customer {
    let name: String
    //let groceries: [Any] // for normal process
    
    // for POP
    let groceries: [GroceryItem]
}


struct Groceries {
    // POP to print the result
    func getCustomerShoppingListPrice(customer: Customer) {
        print("Customer Name: \(customer.name)")
        
        var totalCost: Float = 0
        for item in customer.groceries {
            totalCost += item.totalCost()
            item.itemDescription()
            
        }
        
        print("Total Cost: \(totalCost)")
    }
        
    
    /*
    // Genral approach to print that result
    func getCustomerShoppingListPrice(customer: Customer) {
        print("Customer Name: \(customer.name)")
        
        var totalCost: Float = 0
        for item in customer.groceries {
            
            if let apple = item as? Apple {
                print("Item Name: \(apple.name) Weight: \(apple.weight) Price: \(apple.weight * apple.pricePerKg)")
                totalCost += apple.weight * apple.pricePerKg
            }
            
            if let orange = item as? Orange {
                print("Item Name: \(orange.name) Weight: \(orange.weight) Price: \(orange.weight * orange.pricePerKg)")
                totalCost += orange.weight * orange.pricePerKg
            }
            
        }
        
        print("Total Cost: \(totalCost)")
        
    } */
 
}










