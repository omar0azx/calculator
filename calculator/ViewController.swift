//
//  ViewController.swift
//  calculator
//
//  Created by omar alzhrani on 13/08/1441 AH.
//  Copyright © 1441 omar alzhrani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var savedNumber = 0.0
    var savedOperation = ""
    var resultIsShowing = false
    var opreationIsActive = false
    
    @IBOutlet weak var onScreenNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonPressed(_ sender: Any) {
        if onScreenNum.text == "0" || opreationIsActive || resultIsShowing {
           onScreenNum.text =  String((sender as AnyObject).tag - 1)
            resultIsShowing = false
            opreationIsActive = false
            
        } else {
            onScreenNum.text = onScreenNum.text! + String((sender as AnyObject).tag - 1)
        }
    }
    
    @IBAction func clerPressed(_ sender: Any) {
        onScreenNum.text = "0"
        savedOperation = ""
        savedNumber = 0.0
        opreationIsActive = false
        resultIsShowing = false
      
    }
    @IBAction func additionPressed(_ sender: Any) {
        savedNumber = Double(onScreenNum.text!)!
        savedOperation = "+"
        opreationIsActive = true

    }
    
    @IBAction func divisionPressed(_ sender: Any) {
        savedNumber = Double(onScreenNum.text!)!
        savedOperation = "÷"
        opreationIsActive = true
       
    }
    
    @IBAction func multiplicationPressed(_ sender: Any) {
        savedNumber = Double(onScreenNum.text!)!
        savedOperation = "X"
        opreationIsActive = true
        
    }
    
    @IBAction func subtractionPressed(_ sender: Any) {
        savedNumber = Double(onScreenNum.text!)!
        savedOperation = "-"
        opreationIsActive = true
      
    }
    
    @IBAction func equelPressed(_ sender: Any) {
        switch savedOperation {
        case "+":
            onScreenNum.text = String(savedNumber + Double(onScreenNum.text!)!)
        case "-":
            onScreenNum.text = String(savedNumber - Double(onScreenNum.text!)!)
        case "X":
            onScreenNum.text = String(savedNumber * Double(onScreenNum.text!)!)
        case "÷":
            if Double(onScreenNum.text!)! > 0.0 {
            onScreenNum.text = String(savedNumber / Double(onScreenNum.text!)!)
            } else {
                onScreenNum.text = "Error"
            }
        default:
            print("error")
        }
        resultIsShowing = true

    }
    
}

