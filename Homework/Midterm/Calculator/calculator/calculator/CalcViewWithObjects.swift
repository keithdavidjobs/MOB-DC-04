//
//  CalcViewWithObjects.swift
//  calculator
//
//  Created by Shalev on 10/31/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class CalcViewWithObjects: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    var decimalPushed: Bool = false
    var initialNumber: Float = 0
    var initialNumbersArray: [String] = []
    var secondNumber: Float = 0
    var secondNumbersArray: [String] = []
    var operatorSelected: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.resultsLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func resetBorders()
    {
        self.plusButton.layer.borderWidth = 1
        self.minusButton.layer.borderWidth = 1
        self.multiplyButton.layer.borderWidth = 1
        self.divideButton.layer.borderWidth = 1
    }
    
    func pressNumber(num: Int)
    {
        if self.operatorSelected == ""
        {
            self.initialNumbersArray.append(String(num))
            self.resultsLabel.text = self.initialNumbersArray.joinWithSeparator("")
            self.initialNumber = Float(num)
        }
        else
        {
            self.secondNumbersArray.append(String(num))
            self.resultsLabel.text = self.secondNumbersArray.joinWithSeparator("")
            self.secondNumber = Float(num)
        }
        resetBorders()
    }
    
    func pressOperator(sender: UIButton!, stackedOperator: String)
    {
        self.decimalPushed = false
        sender.layer.borderWidth = 2
        if self.initialNumbersArray.count == 0 || self.operatorSelected == ""
        {
            //the equals button has been pushed or it's the first time an operator was selected
            self.operatorSelected = stackedOperator
            self.initialNumber = Float(self.resultsLabel.text!)!
            self.initialNumbersArray = (self.resultsLabel.text?.componentsSeparatedByString(""))!
        }
        else if self.initialNumbersArray.count > 0 && self.secondNumbersArray.count > 0
        {
            //this is a stacked operator sequence of events
            equals(sender)
            self.operatorSelected = stackedOperator
            self.initialNumber = Float(self.resultsLabel.text!)!
            self.initialNumbersArray = (self.resultsLabel.text?.componentsSeparatedByString(""))!
        }
    }
    
    @IBAction func allClear(sender: AnyObject) {
        self.initialNumber = 0
        self.initialNumbersArray = []
        self.secondNumber = 0
        self.secondNumbersArray = []
        self.decimalPushed = false
        self.operatorSelected = ""
        self.resultsLabel.text = ""
        resetBorders()
    }

    @IBAction func changeSign(sender: AnyObject) {
        if self.operatorSelected == ""
        {
            if self.initialNumber > 0
            {
                self.initialNumbersArray[0] = "-" + self.initialNumbersArray[0]
                self.initialNumber = self.initialNumber * -1
                self.resultsLabel.text = self.initialNumbersArray.joinWithSeparator("")
            }
            else
            {
                self.initialNumbersArray.append("-")
                self.resultsLabel.text = "-0"
            }
        }
        else
        {
            if self.secondNumber > 0
            {
                self.secondNumber = self.secondNumber * -1
                self.secondNumbersArray[0] = "-" + self.secondNumbersArray[0]
                self.resultsLabel.text = self.secondNumbersArray.joinWithSeparator("")
            }
            else
            {
                self.secondNumbersArray.append("-")
                self.resultsLabel.text = "-0"
            }
        }
    }
    @IBAction func percent(sender: AnyObject) {
        if self.operatorSelected == ""
        {
            self.initialNumber /= 100
            self.resultsLabel.text = String(self.initialNumber)
            self.initialNumbersArray = (self.resultsLabel.text?.componentsSeparatedByString(""))!
        }
        else
        {
            self.secondNumber /= 100
            self.resultsLabel.text = String(self.secondNumber)
            self.secondNumbersArray = (self.resultsLabel.text?.componentsSeparatedByString(""))!
        }
    }
    @IBAction func divide(sender: AnyObject) {
        pressOperator(sender as! UIButton, stackedOperator: "divide")
    }
    @IBAction func multiply(sender: AnyObject) {
        pressOperator(sender as! UIButton, stackedOperator: "multiply")
    }
    @IBAction func minus(sender: AnyObject) {
        pressOperator(sender as! UIButton, stackedOperator: "minus")
    }
    @IBAction func plus(sender: AnyObject) {
        pressOperator(sender as! UIButton, stackedOperator: "plus")
    }
    @IBAction func equals(sender: AnyObject) {
        switch self.operatorSelected
        {
            case "plus":
                print("add")
                let finalNum = (NSNumberFormatter().numberFromString(self.initialNumbersArray.joinWithSeparator(""))?.floatValue)! + (NSNumberFormatter().numberFromString(self.secondNumbersArray.joinWithSeparator(""))?.floatValue)!
                self.resultsLabel.text = String(finalNum)
            case "minus":
                print("minus")
                let finalNum = (NSNumberFormatter().numberFromString(self.initialNumbersArray.joinWithSeparator(""))?.floatValue)! - (NSNumberFormatter().numberFromString(self.secondNumbersArray.joinWithSeparator(""))?.floatValue)!
                self.resultsLabel.text = String(finalNum)
            case "divide":
                print("divide")
                let finalNum = (NSNumberFormatter().numberFromString(self.initialNumbersArray.joinWithSeparator(""))?.floatValue)! / (NSNumberFormatter().numberFromString(self.secondNumbersArray.joinWithSeparator(""))?.floatValue)!
                self.resultsLabel.text = String(finalNum)
            case "multiply":
                print("multiply")
                let finalNum = (NSNumberFormatter().numberFromString(self.initialNumbersArray.joinWithSeparator(""))?.floatValue)! * (NSNumberFormatter().numberFromString(self.secondNumbersArray.joinWithSeparator(""))?.floatValue)!
                self.resultsLabel.text = String(finalNum)
            default:
                print("nothing")
        }
        self.operatorSelected = ""
        self.initialNumber = 0
        self.initialNumbersArray = []
        self.secondNumbersArray = []
        self.secondNumber = 0
        self.decimalPushed = false
    }
    @IBAction func decimal(sender: AnyObject) {
        if !self.decimalPushed
        {
            if self.operatorSelected == ""
            {
                //first number
                if self.initialNumber == 0
                {
                    self.initialNumber = 0.0
                    self.initialNumbersArray = ["0", "."]
                }
                else
                {
                    self.initialNumbersArray.append(".")
                }
                self.resultsLabel.text = self.initialNumbersArray.joinWithSeparator("")
                self.initialNumber = (NSNumberFormatter().numberFromString(self.resultsLabel.text!)?.floatValue)!
            }
            else
            {
                //second number
                if self.secondNumber == 0
                {
                    self.secondNumber = 0.0
                    self.secondNumbersArray = ["0", "."]
                }
                else
                {
                    self.secondNumbersArray.append(".")
                }
                self.resultsLabel.text = self.secondNumbersArray.joinWithSeparator("")
                self.secondNumber = (NSNumberFormatter().numberFromString(self.resultsLabel.text!)?.floatValue)!
            }
            self.decimalPushed = true
        }
        resetBorders()
    }
    
    @IBAction func press0(sender: AnyObject) {
        pressNumber(0)
    }
    @IBAction func press1(sender: AnyObject) {
        pressNumber(1)
    }
    @IBAction func press2(sender: AnyObject) {
        pressNumber(2)
    }
    @IBAction func press3(sender: AnyObject) {
        pressNumber(3)
    }
    @IBAction func press4(sender: AnyObject) {
        pressNumber(4)
    }
    @IBAction func press5(sender: AnyObject) {
        pressNumber(5)
    }
    @IBAction func press6(sender: AnyObject) {
        pressNumber(6)
    }
    @IBAction func press7(sender: AnyObject) {
        pressNumber(7)
    }
    @IBAction func press8(sender: AnyObject) {
        pressNumber(8)
    }
    @IBAction func press9(sender: AnyObject) {
        pressNumber(9)
    }
    
}
