//
//  CaloriesViewController.swift
//  Test2
//
//  Created by JeroReyes  on 4/30/20.
//  Copyright © 2020 Jeronimo. All rights reserved.
//

import UIKit

class CaloriesViewController: UIViewController {

    //tableView Outlet
    @IBOutlet weak var caloriesTable: UITableView!
    //default values of a product.
    var currentProductSelected = (product: "Yogurt", totalOunces: 0, totalCalories: 0)
    //food categories
    let foodCategory = ["Dairy","Grains","Fruits"]
    
    //create an array to store each Products with te total amount of ounces and their calories withing them.
    let products = [
        [("Milk",0,12),("Yogurt",0,17),("Cheese",0,114)],
        [("Rice",0,37),("Oats",0,110)],
        [("Apple",0,15),("Banana",0,25)]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //fuction to calculate total calories in each product
    func calculateCaloriesInProducts(_ indexPath: IndexPath){
        let totalCalories = currentProductSelected.totalOunces * products[indexPath.section][indexPath.row].2
        //update total calories of productSelected
        currentProductSelected.totalCalories = totalCalories
    }
    
    //display an alert Window
    func displayAler(){
        let alertController = UIAlertController(title: "\(currentProductSelected.product)", message: "Calories in \(currentProductSelected.totalOunces) ounces of \(currentProductSelected.product): \(currentProductSelected.totalCalories)", preferredStyle: .alert)
        
         let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion:  nil)
        
        
    }

}

//extensions for the tableView
extension CaloriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodCategory.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return foodCategory[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell")
        //give each cell a title
        cell!.textLabel!.text = products[indexPath.section][indexPath.row].0
        //update the image og each cell based on the product title
        cell!.imageView!.image = UIImage(named: "\(products[indexPath.section][indexPath.row].0).png")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //update the currentProduct
        currentProductSelected.product = products[indexPath.section][indexPath.row].0
        
        calculateCaloriesInProducts(indexPath)
        displayAler()//display an alert to the user with the Selected Food, total ounces and total calories.
        
    }
    
    
}
