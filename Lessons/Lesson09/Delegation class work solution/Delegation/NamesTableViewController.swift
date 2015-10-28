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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("namecell", forIndexPath: indexPath) 
        
        // Fill out the user textLabel of the row by grabbing the student's name
        let studentName = names[indexPath.row]
        cell.textLabel?.text = studentName

        return cell
    }
    
    func updateNames(name: String) {
        
    }
    
    func addName(name: String)
    {
        //add code
        print(name)
        self.names.append(name)
        self.tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAddName" {
            let destinationVC = segue.destinationViewController as! AddViewController
            destinationVC.delegate = self
        }
    }

}
