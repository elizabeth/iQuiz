//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Elizabeth on 11/3/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var questions = [[String: Any]]()
    var pickerAnswers = [String]()
    var score = ["correct": 0, "total": 1, "index": 0, "answer": 0, "hasNext": 0]
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("swipe:"))
//        rightSwipe.direction = .right
//        view.addGestureRecognizer(rightSwipe)
        
        self.picker.delegate = self
        self.picker.dataSource = self
        let index = score["index"]!
        
        outer: for i in index..<questions.count {
            if i == index {
                question.text = questions[i]["text"] as! String?
                score["hasNext"] = 0
                pickerAnswers = (questions[i]["answers"] as! [String]?)!
            } else {
                score["hasNext"] = 1
                break outer
            }
            
            if i + 1 == questions.count {
                score["hasNext"] = 0
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        let answerViewController = segue.destination as! AnswerViewController
        
        // set a variable in the second view controller with the data to pass
        answerViewController.questions = questions
        answerViewController.score = score
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerAnswers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 44))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = pickerAnswers[row]
        label.sizeToFit()
        return label
    }

    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        score["answer"] = row
    }
    

    @IBAction func submit(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "toAnswer", sender: self)
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
    
//    func swipe(sender: UISwipeGestureRecognizer) {
////        if (sender.direction == .Left) {
////            println("Swipe Left")
////            var labelPosition = CGPointMake(self.swipeLabel.frame.origin.x - 50.0, self.swipeLabel.frame.origin.y);
////            swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height)
////        }
//        
//        if (sender.direction == .right) {
//            self.performSegue(withIdentifier: "toAnswer", sender: self)
//        }
//    }
    
}
