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
        buttonAnimtion(theButtonTag: (sender as AnyObject).tag)
        if onScreenNum.text == "0" || opreationIsActive || resultIsShowing {
           onScreenNum.text =  String((sender as AnyObject).tag - 1)
            resultIsShowing = false
            opreationIsActive = false
            
        } else {
            onScreenNum.text = onScreenNum.text! + String((sender as AnyObject).tag - 1)
        }
    }
    
    @IBAction func clerPressed(_ sender: Any) {
        buttonAnimtion(theButtonTag: 22)
        onScreenNum.text = "0"
        savedOperation = ""
        savedNumber = 0.0
        opreationIsActive = false
        resultIsShowing = false
      
    }
    @IBAction func additionPressed(_ sender: Any) {
        buttonAnimtion(theButtonTag: 14)
        savedNumber = Double(onScreenNum.text!)!
        savedOperation = "+"
        opreationIsActive = true

    }
    
    @IBAction func divisionPressed(_ sender: Any) {
        buttonAnimtion(theButtonTag: 11)
        savedNumber = Double(onScreenNum.text!)!
        savedOperation = "÷"
        opreationIsActive = true
       
    }
    
    @IBAction func multiplicationPressed(_ sender: Any) {
        buttonAnimtion(theButtonTag: 12)
        savedNumber = Double(onScreenNum.text!)!
        savedOperation = "×"
        opreationIsActive = true
        
    }
    
    @IBAction func subtractionPressed(_ sender: Any) {
        buttonAnimtion(theButtonTag: 13)
        savedNumber = Double(onScreenNum.text!)!
        savedOperation = "-"
        opreationIsActive = true
      
    }
    
    @IBAction func equelPressed(_ sender: Any) {
        buttonAnimtion(theButtonTag: 15)
        switch savedOperation {
        case "+":
            onScreenNum.text = String(savedNumber + Double(onScreenNum.text!)!)
        case "-":
            onScreenNum.text = String(savedNumber - Double(onScreenNum.text!)!)
        case "×":
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
    func buttonAnimtion(theButtonTag: Int) {
        UIView.animate(withDuration: 0.05, animations: {
            if theButtonTag <= 10 {
                self.view.viewWithTag(theButtonTag)?.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            } else { self.view.viewWithTag(theButtonTag)?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
               }, completion: { _ in
                if theButtonTag >= 11 && theButtonTag < 20 {
                   self.view.viewWithTag(theButtonTag)?.backgroundColor = #colorLiteral(red: 1, green: 0.6862745098, blue: 0, alpha: 1)
                } else if theButtonTag < 12 {
                    self.view.viewWithTag(theButtonTag)?.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
                } else if theButtonTag >= 20 {
                    self.view.viewWithTag(theButtonTag)?.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
                }
               })
    }

    
}

