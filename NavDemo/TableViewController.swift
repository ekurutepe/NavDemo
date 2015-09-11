//
//  TableViewController.swift
//  
//
//  Created by Engin Kurutepe on 11/09/15.
//
//

import UIKit

let items = [
    "🍎 Apples" : ["Belle de Boskoop", "Golden Delicious", "Granny Smith"],
    "🍊 Oranges" : ["Valencia", "Washington"]
]

class TableViewController: UITableViewController {

    let tabBarControllerDelegate = AnimatedTabBarControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = items.keys.array.reverse()[indexPath.item]

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ItemSelection" {
            if let tabController = segue.destinationViewController as? UITabBarController, cell = sender as? UITableViewCell {
                
                tabController.delegate = self.tabBarControllerDelegate

                let indexPath = self.tableView.indexPathForCell(cell)
                
                let category = items.keys.array[indexPath!.item]
                let titles = items[category]!
                
                var viewControllers = [UIViewController]()
                for title in titles {
                    viewControllers.append(self.viewControllerWithTitle(title))
                }
                
                tabController.setViewControllers(viewControllers, animated: false)
            
            }
        }
    }
    
    func viewControllerWithTitle(title: String) -> UIViewController {
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("GenericViewController") as! GenericViewController
        
        vc.title = title
        
        return vc
    }


}
