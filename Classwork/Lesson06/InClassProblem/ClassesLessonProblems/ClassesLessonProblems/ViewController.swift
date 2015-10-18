//
//  ViewController.swift
//  ClassesLessonProblems
//
//  Created by Tedi Konda on 9/12/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//


// Functions of use for this exercise:
// Translating a string to an integer: "1".toInt()
// Getting the text from a text field: let text = textFieldName.text
// Setting the text on a text label or text field: textLabelName.text = "some text"

// TO DO: Create a player class (hint: player file already created) that has properties for name, and optionally one or more of the following: age, gender, weight, and height.

// TO DO: Create four text fields in interface builder. Each player has a text field for name and one of the other properties.

// TO DO: Create a button in interface builder and tie it to an IB action. The action matches player 1 vs player 2 and decides a winner based on one of the characteristics/properties mentioned above. You set your own rule.

// TO DO: Display the result of the match in a label. Every time the user taps the match button, a new result is generated.

// BONUS 1: Change the background color of the canvas for every match randomly (hint, have an array of UI Colors, and randomly pick color from that array).

// Bonus 2: Have all the game logic in an additional Game class (additional to player class).

// Bonus 3: Select winner based on multiple properties.


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var p1Name: UITextField!
    @IBOutlet weak var p2Name: UITextField!
    @IBOutlet weak var p1Prop: UITextField!
    @IBOutlet weak var p2Prop: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //var myGame: Game()
    }
    
    @IBAction func playButton(sender: AnyObject)
    {
        //code
        if(self.p1Name.text != "")
        {
        }
        if(Int(self.p1Prop.text!)) == nil
        {
            print("you did not enter an integer")
        }
        var player1 = Player(name: self.p1Name.text!, age: Int(self.p1Prop.text!), weight: nil, gender: nil, height: nil)
        var player2 = Player(name: self.p2Name.text!, age: Int(self.p2Prop.text!), weight: nil, gender: nil, height: nil)
        if player1.age > player2.age
        {
            self.statusLabel.text = "\(player1.name) beat \(player2.name)"
        }
        else
        {
            self.statusLabel.text = "\(player2.name) beat \(player1.name)"
        }
    }


}

