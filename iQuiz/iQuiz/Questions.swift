//
//  Questions.swift
//  iQuiz
//
//  Created by Elizabeth on 11/3/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class Questions: NSObject {
    static let shared = Questions()
    
    lazy var subjects = [shared.mathematics, shared.marvel, shared.science]
    
    let mathematics = ["subject":"Mathematics", "descr":"Basic and complex operations", "icon":"mathicon"]
    lazy var mathQ : [[String: String]] = [["question": "What is 5 + 5?", "answer": shared.mathA[0][0]], ["question": "What is the derivative of 2?", "answer": shared.mathA[1][3]], ["question": "", "answer": shared.mathA[2][2]]]
    lazy var mathA = [["10", "8", "6", "4"], ["2", "1", "4", "0"], ["", "", "", ""]]
    
    let marvel = ["subject":"Marvel Super Heroes", "descr":"Super heroes to the rescue!", "icon":"marvelicon"]
    lazy var marvelQ : [[String: String]] = [["question": "What is Black Widow's name?", "answer": shared.marvelA[0][0]], ["question": "Which of the following is not one of Deadpool's superpowers?", "answer": shared.marvelA[1][1]]]
    lazy var marvelA = [["Natasha Romanova", "Carol Danvers", "Anita Blake", "Betty Ross"], ["X-ray Vision", "Ryan Reynolds", "Healing", "Natural Strength"]]
    
    let science = ["subject":"Science", "descr":"Do you have what it takes to be a scientist?", "icon":"scienceicon"]
    lazy var scienceQ : [[String: String]] = [["question": "Why do cats always land on their feet?", "answer": shared.scienceA[0][2]]]
    lazy var scienceA = [["They weigh less", "Their claws", "They're cats", "Sound localization"]]
}
