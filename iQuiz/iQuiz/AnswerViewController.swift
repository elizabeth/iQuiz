//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Elizabeth on 11/3/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var icon: UIImageView!
    var score = [String: Int]()
    var questions = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let index = score["index"]!
        let quest = questions[index]
        question.text = quest["text"] as? String!
        let correctIndex = Int((quest["answer"] as? String)!)! - 1
        
        if correctIndex == score["answer"]! {
            score["correct"] = score["correct"]! + 1
            icon.image = UIImage(named: "checkmarkicon")
        } else {
            icon.image = UIImage(named: "xicon")
        }
        
        let answers = quest["answers"] as! [String]
        answer.text = answers[correctIndex] as String?

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        leftSwipe.direction = .left
        leftSwipe.numberOfTouchesRequired = 1
        
        view.addGestureRecognizer(leftSwipe)
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if score["hasNext"] == 1 {
            self.performSegue(withIdentifier: "answerToQuestion", sender: self)
        } else {
            self.performSegue(withIdentifier: "toFinish", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "answerToQuestion" {
            score["index"] = score["index"]! + 1
            let questionViewController = segue.destination as! QuestionViewController
            questionViewController.questions = questions
            questionViewController.score = score
        } else if segue.identifier == "toFinish" || segue.identifier == "swipeToFinish" {
            score["total"] = questions.count
            let finishViewController = segue.destination as! FinishedViewController
            finishViewController.score = score
        }
    }
    
    @IBAction func next(_ sender: AnyObject) {
        if score["hasNext"] == 1 {
            self.performSegue(withIdentifier: "answerToQuestion", sender: self)
        } else {
            self.performSegue(withIdentifier: "toFinish", sender: self)
        }
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
