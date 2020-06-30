//
//  toDoTCell.swift
//  Zoom-MVP
//
//  Created by Mohamed Arafa on 6/30/20.
//  Copyright © 2020 SolxFy. All rights reserved.
//

import UIKit

class toDoTCell: UITableViewCell, reloadCellTitles {

    @IBOutlet weak var titleLBL: UILabel!
    
    func reloadTitle(title: String) {
        titleLBL.text = title
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
