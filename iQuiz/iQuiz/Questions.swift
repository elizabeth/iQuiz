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
    
    var data = [[String: Any]]()
    // a file named Questions in the documents directory
    private static let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "questions"
    
    override init() {
        super.init()
        loadData()
    }
    
    func loadData() {
        let local = NSKeyedUnarchiver.unarchiveObject(withFile: Questions.filePath) as? [[String: Any]]
        
//        if local != nil {
//            self.data = local!
//        } else {
            let nsUrl = NSURL(string: url)
            let session = URLSession.shared
            let task = session.dataTask(with: nsUrl as! URL, completionHandler: {urlData, response, error in
                do {
                    let jsonresult = try JSONSerialization.jsonObject(with: urlData!, options: []) as! [[String: AnyObject]]
                    NSKeyedArchiver.archiveRootObject(jsonresult, toFile: Questions.filePath)
                    self.data = jsonresult
                } catch {
                    print(error)
                }
            })
            task.resume()

        //}
    }
    
//    let data = [
//        [
//            "title":"Science!",
//            "desc":"Because SCIENCE!",
//            "icon": "scienceicon",
//            "questions":[
//                [
//                    "text":"What is fire?",
//                    "answer":"1",
//                    "answers":[
//                        "One of the four classical elements",
//                        "A magical reaction given to us by God",
//                        "A band that hasn't yet been discovered",
//                        "Fire! Fire! Fire! heh-heh"
//                    ]
//                ]
//            ]
//        ],
//        [
//            "title":"Marvel Super Heroes",
//            "desc": "Avengers, Assemble!",
//            "icon": "marvelicon",
//            "questions":[
//                [
//                    "text":"Who is Iron Man?",
//                    "answer":"1",
//                    "answers":[
//                        "Tony Stark",
//                        "Obadiah Stane",
//                        "A rock hit by Megadeth",
//                        "Nobody knows"
//                    ]
//                ],
//                [
//                    "text":"Who founded the X-Men?",
//                    "answer":"2",
//                    "answers":[
//                        "Tony Stark",
//                        "Professor X",
//                        "The X-Institute",
//                        "Erik Lensherr"
//                    ]
//                ],
//                [
//                    "text":"How did Spider-Man get his powers?",
//                    "answer":"1",
//                    "answers":[
//                        "He was bitten by a radioactive spider",
//                        "He ate a radioactive spider",
//                        "He is a radioactive spider",
//                        "He looked at a radioactive spider"
//                    ]
//                ]
//            ]
//        ],
//        [
//            "title":"Mathematics",
//            "desc":"Did you pass the third grade?",
//            "icon": "mathicon",
//            "questions":[
//                [
//                    "text":"What is 2+2?",
//                    "answer":"1",
//                    "answers":[
//                        "4",
//                        "22",
//                        "An irrational number",
//                        "Nobody knows"
//                    ]
//                ]
//            ]
//        ]
//    ]
}
