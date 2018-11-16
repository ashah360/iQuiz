//
//  TableViewCell.swift
//  iquiz
//
//  Created by Arman Shah on 10/30/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var subjectDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
