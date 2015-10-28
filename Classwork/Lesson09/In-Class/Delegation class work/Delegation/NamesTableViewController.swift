//
//  NamesTableViewController.swift
//  Delegation
//
//  Created by Tedi Konda on 10/26/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit


class NamesTableViewController: UITableViewController, AddNameDelegate {
    
    // Keep track of all names in this array
    var names = [String]()
    var deletedNames = [String]()
    var showDeleted: Bool = false
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("namecell", forIndexPath: indexPath) 
        
        // Fill out the user textLabel of the row by grabbing the student's name
        if self.showDeleted
        {
            let studentName = self.deletedNames[indexPath.row]
            cell.textLabel?.text = studentName
        }
        else
        {
            let studentName = names[indexPath.row]
            cell.textLabel?.text = studentName
        }
        
        return cell
    }
    
    func addName(name: String)
    {
        print(name)
        
        self.names.append(name)
        self.tableView.reloadData()
    }
    
    func updateNames(name: String) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sequeAddName" {
            let destinationVC = segue.destinationViewController as! AddViewController
            destinationVC.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //self.gaCampuses.removeAtIndex(indexPath.row)
            self.deletedNames.append(self.names[indexPath.row])
            self.names.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    @IBAction func showDeletedNames(sender: AnyObject)
    {
        self.showDeleted = !self.showDeleted
        self.tableView.reloadData()
    }
    
}
