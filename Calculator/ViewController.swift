//
//  ViewController.swift
//  Calculator
//
//  Created by Field Employee on 11/25/20.
//

import UIKit

class ViewController: UIViewController {
    
    var numOnScreen: Double = 0
    var previousNum: Double = 0
    var performingMath = false
    var operation = 0
    
    
    @IBAction func buttons(_ sender: UIButton) {
    
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNum = Double(label.text!)!
            
            if sender.tag == 12{ //Divide
                label.text = "/"
            }
            if sender.tag == 13{ //multiply
                label.text = "x"
            }
            if sender.tag == 14{ //subtract
                label.text = "-"
            }
            if sender.tag == 15{ //add
                label.text = "+"
            }
            if sender.tag == 17{
                label.text = "%"
            }
            
            operation = sender.tag
            performingMath = true
            
        }else if sender.tag == 16 {
            
            if operation == 12{ //divide
                label.text = String(previousNum / numOnScreen)
            } else if operation == 13{ //multiply
                label.text = String(previousNum * numOnScreen)
            } else if operation == 14{ //subtract
                label.text = String(previousNum - numOnScreen)
            } else if operation == 15{ //add
                label.text = String(previousNum + numOnScreen)
            } else if operation == 17{
                label.text = String(numOnScreen / 100)
            }
        } else if sender.tag == 11{
            label.text = ""
            previousNum = 0
            numOnScreen = 0
            operation = 0
        }
        
    
    }
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
    
        if performingMath == true {
            label.text = String(sender.tag-1)
            numOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag-1)
            numOnScreen = Double(label.text!)!
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

