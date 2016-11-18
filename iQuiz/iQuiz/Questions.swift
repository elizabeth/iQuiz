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
    private static let urlFilePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "questionsUrl"
    
    override init() {
        super.init()
        loadData()
    }
    
    func loadData() {
        let local = NSKeyedUnarchiver.unarchiveObject(withFile: Questions.filePath) as? [[String: Any]]
        let newUrl = NSKeyedUnarchiver.unarchiveObject(withFile: Questions.urlFilePath) as? String
        
        if local != nil && newUrl != nil {
            url = newUrl!
            self.data = local!
        } else {
            retrieveData()
        }
    }
    
    func retrieveData() {
        let nsUrl = NSURL(string: url)
        let session = URLSession.shared
        if nsUrl != nil {
            let task = session.dataTask(with: nsUrl as! URL, completionHandler: {urlData, response, error in
                if urlData != nil {
                    do {
                        let jsonresult = try JSONSerialization.jsonObject(with: urlData!, options: []) as! [[String: Any]]
                        NSKeyedArchiver.archiveRootObject(jsonresult, toFile: Questions.filePath)
                        NSKeyedArchiver.archiveRootObject(url, toFile: Questions.urlFilePath)
                        self.data = jsonresult
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
                    } catch {
                        print(error)
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "failedLoad"), object: nil)
                    }
                } else {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "failedLoad"), object: nil)
                }
            })
            task.resume()
        } else {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "failedLoad"), object: nil)
        }
    }
}
