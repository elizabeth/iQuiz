//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Elizabeth on 11/10/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var url: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // if has local url, use that instead
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setURL(_ sender: AnyObject) {
        // get json to use. if it is invalid/cannot get, change url back to default and show error pop up
        // successful or not and then close
        //dismiss(animated: true, completion: nil)
        
    }

    @IBAction func close(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
