//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Elizabeth on 11/3/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    var score = [String: Int]()
    var descrip = ["Nice try!", "Fantastic!"]
    @IBOutlet weak var descriptive: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let correct = score["correct"]!
        let total = score["total"]!
        
        totalScore.text = "\(correct) / \(total)"
        
        if correct / total == 0 {
            descriptive.text = descrip[0]
        } else {
            descriptive.text = descrip[1]
        }
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        rightSwipe.direction = .right
        rightSwipe.numberOfTouchesRequired = 1
        view.addGestureRecognizer(rightSwipe)
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if sender.direction == .right {
            _ = self.navigationController?.popToRootViewController(animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // save data here for part 3
        // for now do nothing
    }
    

    @IBAction func next(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "toMain", sender: self)
    }
    
    override func willMove(toParentViewController parent:UIViewController?)
    {
        super.willMove(toParentViewController: parent)
        
        if (parent == nil) {
            if let navigationController = self.navigationController {
                var viewControllers = navigationController.viewControllers
                let viewControllersCount = viewControllers.count
                if (viewControllersCount > 2) {
                    viewControllers = [viewControllers[0], viewControllers[viewControllersCount-1]]
                    navigationController.setViewControllers(viewControllers, animated:false)
                }
            }
        }
    }
}
