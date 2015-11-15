//
//  ViewController.swift
//  PersistanceExample
//
//  Created by Shalev on 11/9/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var displayData: UILabel!
    @IBOutlet weak var propertySelector: UISegmentedControl!
    @IBOutlet weak var storyTextView: UITextView!
    
    //let myTodos = NSBundle.mainBundle().pathForResource("Todos", ofType: "plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(sender: AnyObject) {
//        var myNewToDo: NSMutableArray?
//        if let path = NSBundle.mainBundle().pathForResource("Todos", ofType: "plist")
//        {
//            myNewToDo = NSMutableArray(contentsOfFile: path)
//            if let tempText = self.userInput.text
//            {
//                myNewToDo?.addObject(tempText)
//                myNewToDo?.writeToFile(path, atomically: true)
//                loadData()
//            }
//        }
        print(self.propertySelector.selectedSegmentIndex)
        var myNewDict: NSMutableDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Students", ofType: "plist")
        {
            myNewDict = NSMutableDictionary(contentsOfFile: path)
            if let tempText = self.userInput.text
            {
                switch self.propertySelector.selectedSegmentIndex
                {
                    case 0:
                        myNewDict?.setObject(tempText, forKey: "age")
                    case 1:
                        myNewDict?.setObject(tempText, forKey: "gender")
                    case 2:
                        myNewDict?.setObject(tempText, forKey: "height")
                    default:
                        myNewDict?.setObject(tempText, forKey: "age")
                        break
                }
                myNewDict?.writeToFile(path, atomically: true)
                
            }
            
        }
        loadData()
    }
    
    func loadData()
    {
//        let myTodos = NSBundle.mainBundle().pathForResource("Todos", ofType: "plist")
//        let toDosArray = NSArray(contentsOfFile: myTodos!)
//        
//        print(toDosArray)
//        self.displayData.text = String(toDosArray!.lastObject!)
        self.displayData.text = ""
        if let myStudentInfo = NSBundle.mainBundle().pathForResource("Students", ofType: "plist")
        {
            let myStudentDictionary = NSDictionary(contentsOfFile: myStudentInfo)
            for (key, val) in myStudentDictionary!
            {
                self.displayData.text! += (val as! String) + "\n"
            }
        }
    }

    @IBAction func saveStory(sender: AnyObject) {
    }
    
    @IBAction func loadStory(sender: AnyObject) {
        let path = NSTemporaryDirectory() + "mystory.txt"
        let myStory: NSString? = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        if let returnedStory = myStory
        {
            print(returnedStory)
        }
    }
}

