//
//  ServingSizeControllerViewController.swift
//  Test2
//
//  Created by JeroReyes  on 4/30/20.
//  Copyright © 2020 Jeronimo. All rights reserved.
//

import UIKit

class ServingSizeControllerViewController: UIViewController {
    
    //PickerView Outlet
    @IBOutlet weak var ServingOuncePickerView: UIPickerView!
   //reult of calories ->
    @IBOutlet weak var totalCaloriesLabel: UILabel!
    
    //data for ounces and pounds
    let servingSize = ["Pounds", "Ounces"]
    let componentsInPickerView = [
        [0,1,2,3,4,5,6,7,8,9],
        [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//extensions for picker view
extension ServingSizeControllerViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0){
            return componentsInPickerView[0].count
        }
        
        else{
            return componentsInPickerView[1].count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0){
            return "\(componentsInPickerView[0][row])"
            //return "\(componentsInPickerView[component][row])" to avoid if else statements. 
        }
        
        else {
            return "\(componentsInPickerView[1][row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //apply the formula to convert punds to uonces, then  add the selected ounces.
        let punToOunces = ServingOuncePickerView.selectedRow(inComponent: 0) * 16 + ServingOuncePickerView.selectedRow(inComponent: 1)
        //update the totalCaloriesLabel
        totalCaloriesLabel.text = "\(punToOunces) Ounces"
        
        //copy this data to CaloriesViewController to display it.
         let vC = (parent as! FoodCaloriesViewController).viewControllers![1] as! CaloriesViewController
        
        vC.currentProductSelected.totalOunces = punToOunces
    }
    
}
