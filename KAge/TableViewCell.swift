//
//  TableViewCell.swift
//  practice
//
//  Created by SayukiYamada on 2022/06/04.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(name: String,age: String){
        nameLabel.text = name
        ageLable.text = age
    }

}
