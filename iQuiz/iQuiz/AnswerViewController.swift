//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/3/16.
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
        let correctIndex = Int((quest["answer"] as? String)!)!
        
        if correctIndex == score["answer"]! {
            print(score["answer"]!)
            print(correctIndex)
            icon.image = UIImage(named: "checkmarkicon")
        } else {
            icon.image = UIImage(named: "xicon")
        }
        
        let answers = quest["answers"] as! [String]
        answer.text = answers[correctIndex] as String?

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "answerToQuestion" {
            let questionViewController = segue.destination as! QuestionViewController
            questionViewController.questions = questions
            questionViewController.score = score
        } else if segue.identifier == "toFinish" {
            let finishViewController = segue.destination as! FinishedViewController
            finishViewController.score = score
        }
    }
    
    @IBAction func next(_ sender: AnyObject) {
        if score["hasNext"] == 1 {
            self.performSegue(withIdentifier: "answerToQuestion", sender: self)
        } else {
            score["total"] = questions.count
            self.performSegue(withIdentifier: "toFinish", sender: self)
        }
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
