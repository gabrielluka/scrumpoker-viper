//
//  SprintsTableViewCell.swift
//  scrumpoker
//
//  Created by Gabriel Lucas Santos on 20/06/21.
//

import UIKit

class SprintsTableViewCell: UITableViewCell {


    @IBOutlet weak var nameSprintLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(sprint: Sprint) {
        nameSprintLabel.text = sprint.nome
    }

}
