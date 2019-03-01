//
//  BookmarkTableViewController.swift
//  Bitemark
//
//  Created by Dan on 2/22/19.
//  Copyright © 2019 Bitemark. All rights reserved.
//

import UIKit
import CoreData

class BookmarkTableViewController: UITableViewController {
    
    var bitemarkItems : Array<BitemarkMO>! = Array()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let moc = delegate.persistentContainer.viewContext
        let bitemarkFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bitemark")
        do {
            let allBitemarks = try moc.fetch(bitemarkFetch) as! [BitemarkMO]
        
            bitemarkItems = allBitemarks
            
        } catch {
            fatalError("Could not retrieve bitemarks from data store.")
        }
               
        self.title = "Favorite Bites"

        //self.navigationItem.rightBarButtonItem = UIBarButtonItem.
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bitemarkItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "BiteCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "BiteCell")
        }
        cell?.textLabel?.text = bitemarkItems[indexPath.row].name

        return cell!
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
