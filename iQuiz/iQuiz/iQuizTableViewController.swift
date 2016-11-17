//
//  iQuizTableViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/3/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

var url = "http://tednewardsandbox.site44.com/questions.json"
class iQuizTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    var model = [[String : Any]]()
    var questions = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model = Questions.shared.data
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestion" {
            let questionViewController = segue.destination as! QuestionViewController
            
            questionViewController.questions = questions
        }
//        else if segue.identifier == "viewSettings" {
//            let popoverViewController = segue.destination as! SettingsViewController
//            popoverViewController.popoverPresentationController!.delegate = self
//        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subjectIdentifier", for: indexPath) as! iQuizTableViewCell
        
        let set = model[indexPath.row]

         //Configure the cell...
        cell.subjectLabel.text = set["title"] as! String?
        cell.descriptionLabel.text = set["desc"] as! String?
        //cell.icon.image = UIImage(named: (set["icon"] as! String))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        questions = model[indexPath.row]["questions"] as! [[String : Any]]
        
        // Start segue with index of cell clicked
        self.performSegue(withIdentifier: "toQuestion", sender: self)
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

}
