//
//  StudentsTableViewController.swift
//  Students
//
//  Created by TK on 7/26/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController, StudentDelegate {
    
    private var store = StudentStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addStudent" {
            // The destination VC is a navigation controller
            let destinationVC = segue.destinationViewController as! UINavigationController
            
            // We need to get the top viewcontroller
            let addStudentVC = destinationVC.topViewController as! AddViewController
            
            // Set the delegate
            addStudentVC.delegate = self
        }
    }
    
    // MARK: - Student Delegate
    func addStudent(name name: String, location: String) {
        store.addStudentWithName(name, location: location)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.students.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath) 
        
        let studentForRow = store.students[indexPath.row]
        cell.textLabel?.text = studentForRow.name
        cell.detailTextLabel?.text = studentForRow.location

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            store.deleteStudentAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
}
