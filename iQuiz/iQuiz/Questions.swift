//
//  Questions.swift
//  iQuiz
//
//  Created by iGuest on 11/3/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class Questions: NSObject {
    static let shared = Questions()
    
    let mathematics = ["subject":"Mathematics", "descr":"Basic and complex operations", "icon":"mathicon"]
    let marvel = ["subject":"Marvel Super Heroes", "descr":"Super heroes to the rescue!", "icon":"marvelicon"]
    let science = ["subject":"Science", "descr":"Do you have what it takes to be a scientist?", "icon":"scienceicon"]
}
