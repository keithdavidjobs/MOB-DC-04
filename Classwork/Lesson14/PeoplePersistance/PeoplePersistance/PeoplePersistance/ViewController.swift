//
//  ViewController.swift
//  PeoplePersistance
//
//  Created by Shalev on 11/16/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var searchFilter: UITextField!
    
    var appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(sender: AnyObject) {
        let moc = appDelegate.managedObjectContext
        
        let person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc) as! Person
        
        person.name = self.nameField.text!
        person.age = Int32(self.ageField.text!)!
        person.gender = self.genderField.text!
        
        do
        {
            try moc.save()
        }
        catch _
        {
            print("Could not save")
        }
        //Dont do this
        //try! moc.save()
    }

    @IBAction func loadData(sender: AnyObject) {
        let moc = appDelegate.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Person")
        
        //filter
        if let tempFilter = self.searchFilter.text
        {
            if tempFilter != ""
            {
                let nameFilter = NSPredicate(format: "name contains %@", tempFilter)
                
                fetch.predicate = nameFilter
            }
        }
        
        //sort
        let sortByAge = NSSortDescriptor(key: "age", ascending: true)
        let sortByName = NSSortDescriptor(key: "name", ascending: true)
        fetch.sortDescriptors = [sortByAge, sortByName]
        
        do
        {
            let people: [Person] = try moc.executeFetchRequest(fetch) as! [Person]
            for person in people
            {
                print(person.age)
                print(person.name)
                print(person.gender)
            }
        }
        catch _
        {
            print("Could not load")
        }
        
//        if let people: [Person] = try! moc.executeFetchRequest(fetch) as? [Person]
//        {
//            print(people)
//        }
    }
}

