//
//  iQuizTableViewCell.swift
//  iQuiz
//
//  Created by iGuest on 11/3/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class iQuizTableViewCell: UITableViewCell {
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
