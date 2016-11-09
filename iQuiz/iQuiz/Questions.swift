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
    
    let data = [
        [
            "title":"Science!",
            "desc":"Because SCIENCE!",
            "icon": "scienceicon",
            "questions":[
                [
                    "text":"What is fire?",
                    "answer":"1",
                    "answers":[
                        "One of the four classical elements",
                        "A magical reaction given to us by God",
                        "A band that hasn't yet been discovered",
                        "Fire! Fire! Fire! heh-heh"
                    ]
                ]
            ]
        ],
        [
            "title":"Marvel Super Heroes",
            "desc": "Avengers, Assemble!",
            "icon": "marvelicon",
            "questions":[
                [
                    "text":"Who is Iron Man?",
                    "answer":"1",
                    "answers":[
                        "Tony Stark",
                        "Obadiah Stane",
                        "A rock hit by Megadeth",
                        "Nobody knows"
                    ]
                ],
                [
                    "text":"Who founded the X-Men?",
                    "answer":"2",
                    "answers":[
                        "Tony Stark",
                    "Professor X",
                    "The X-Institute",
                    "Erik Lensherr"
                    ]
                ],
                [
                    "text":"How did Spider-Man get his powers?",
                    "answer":"1",
                    "answers":[
                        "He was bitten by a radioactive spider",
                        "He ate a radioactive spider",
                        "He is a radioactive spider",
                        "He looked at a radioactive spider"
                    ]
                ]
            ]
        ],
        [
            "title":"Mathematics",
            "desc":"Did you pass the third grade?",
            "icon": "mathicon",
            "questions":[
                [
                    "text":"What is 2+2?",
                    "answer":"1",
                    "answers":[
                        "4",
                        "22",
                        "An irrational number",
                        "Nobody knows"
                    ]
                ]
            ]
        ]
    ]
}
