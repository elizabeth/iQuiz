//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/3/16.
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
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        let index = score["index"]!
        outer: for i in index..<questions.count {
            if i == index {
                question.text = questions[i]["text"] as! String?
                score["answer"] = Int(questions[i]["answer"] as! String)
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
        
        // Do any additional setup after loading the view.
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
    
    // The data to return for the row and component (column) that's being passed in
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerAnswers[row]
//    }
//    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
